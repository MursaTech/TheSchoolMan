class AttendanceSheetsController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @attendances = AttendanceSheet.all
    respond_with(@attendances)
  end

  def show
    respond_with(@attendance)
  end

  def new
    @attendance = AttendanceSheet.new
    respond_with(@attendance)
  end

  def edit
  end

  def create
    @attendance = AttendanceSheet.new(attendance_params)
    @attendance.save
    respond_with(@attendance)
  end

  def update
    @attendance.update(attendance_params)
    respond_with(@attendance)
  end

  def destroy
    @attendance.destroy
    respond_with(@attendance)
  end

  private
    def set_attendance
      @attendance = AttendanceSheet.find(params[:id])
    end

    def attendance_params
      params.require(:attendance).permit(:student_id, :user_id, :stream_id, :present)
    end
end
