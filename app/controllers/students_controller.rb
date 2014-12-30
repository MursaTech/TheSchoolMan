class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    if params[:class]
      @students = Student.where(stream_id: params[:class])
    else
      @students = Student.all.order('created_at desc').page params[:page]
    end
    # respond_with(@students)
    respond_to do |format|
      format.json { render json: { students: @students} }
      format.html { render action: 'index' }
    end
  end

  def show
    respond_with(@student)
    # @student = Student.find(params[:id])
    # respond_to do |format|
    #   format.json { render json: { student: @student} }
    #   format.html { render action: 'show' }
    # end
  end

  def new
    @student = Student.new
    respond_with(@student)
  end

  def edit
  end

  def create
    begin
      guardian = Guardian.find(params[:guardian])
    rescue Exception => e
      guardian = Guardian.find_or_create_by! name: params[:guardian_name], phone_number: params[:guardian_number],
               address: params[:guardian_address], id_number: params[:guardian_id_no]
    end
    @student = Student.new(student_params)
    @student.guardian_id = guardian.id
    @student.save
    respond_with(@student)
  end

  def update
    @student.update(student_params)
    respond_with(@student)
  end

  def destroy
    @student.destroy
    respond_with(@student)
  end

  def upload_page
    @student = Student.new
  end

  def delete_multiple
    deleted = 0
    params[:delete_students].split(',').each do |id|
      Student.find_by(id: id).destroy
      deleted = deleted + 1
    end
    redirect_to students_path, notice: "You have deleted #{deleted} students."
  end

  def bulk_upload
    file = params[:student][:upload_file]
    is_xlsx = File.extname(file.original_filename) == ".xlsx"
    is_xls = File.extname(file.original_filename) == ".xls"
    is_csv = File.extname(file.original_filename) == ".csv"
    imported = 0
    duplicates = 0

    if is_xlsx
      xlsx_file = nil

      xlsx_file = params[:student][:upload_file]
      if params[:student][:upload_file].is_a? ActionDispatch::Http::UploadedFile
        xlsx_file = params[:student][:upload_file].tempfile
      end

      doc = SimpleXlsxReader.open(xlsx_file)          
      students = doc.sheets.first.rows[1..doc.sheets.first.rows.length]     
      puts ">>>>>>>>>>>>>> #{students}" 
      # students = students.collect { |r| [r.first,r.last] }  
      import_students students      

      # render json: { success: true, imported: imported, duplicates: duplicates }
      redirect_to students_path, notice: "Import successful"
    elsif is_csv
      csv_text = nil
      if !params[:student][:upload_file].is_a? ActionDispatch::Http::UploadedFile
        csv_text = File.read(params[:student][:upload_file])
      else
        csv_text = File.read(params[:student][:upload_file].tempfile)
      end

      csv = CSV.parse(csv_text, :headers => true)   
      students = csv.collect { |r| [r[0],r[1]] }
      import_students students      

      # render json: { success: true, imported: imported, duplicates: duplicates }
      redirect_to students_path, notice: "Import successful"
   elsif is_xls
      if file.is_a? ActionDispatch::Http::UploadedFile
        xls_file = file.tempfile
      else
        xls_file = file
      end
      Spreadsheet.open(xls_file.path) do |book|
        students = book.worksheet(0).collect { |r| [r[0],r[1].to_i.to_s ] }
        import_students students[1..students.length]        
      end
      # render json: { success: true, imported: imported, duplicates: duplicates }
      redirect_to students_path, notice: "Import successful"
    else
      render json: { success: false, error: "Not a valid students file" }
    end
  end

  def import_students array
    # :name, :dob, :join_date :admission_number, :stream, :previous_school, :last_exam_score, guardian -> name, phone_number, address, id_number
    array.each do |element|
      puts element
      if !element.include?(nil)
        name = element[0]
        guardian = Guardian.find_or_create_by! name: element[6], phone_number: element[7], address: element[8], id_number: element[9]
        if Student.find_by(admission_number: element[2]).nil?
          student = Student.create! name: name, admission_number: element[2],# account: ActsAsTenant.current_tenant, 
                    dob: element[1], stream_id: Stream.find_or_create_by!(name: element[3]).id, previous_school: element[4],
                    last_exam_score: element[5], guardian_id: guardian.id
        end
      end
    end
  end

  def add_to_class
    added = 0
    stream = Stream.find_by(name: params[:stream])
    if !stream.nil?
      params[:students].split(',').each do |id|
        Student.find_by(id: id).update(stream_id: stream.id)
        added += 1
      end
      redirect_to students_path, notice: "You have added #{added} students to #{stream.name}."
    else
      redirect_to students_path, notice: "Please select a class to add the students to."
    end
  end

  def forms_and_streams
    render json: Form.find(params[:form]).streams
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :dob, :admission_number, :account_id, :guardian_id, :stream_id, :photo, :previous_school, :last_exam_score)
    end
end
