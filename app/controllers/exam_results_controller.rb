class ExamResultsController < ApplicationController
  before_action :set_exam_result, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @exam_results = ExamResult.all
    respond_with(@exam_results)
  end

  def show
    respond_with(@exam_result)
  end

  def new
    @exam_result = ExamResult.new
    respond_with(@exam_result)
  end

  def edit
  end

  def create
    @exam_result = ExamResult.new(exam_result_params)
    @exam_result.save
    respond_with(@exam_result)
  end

  def update
    @exam_result.update(exam_result_params)
    respond_with(@exam_result)
  end

  def destroy
    @exam_result.destroy
    respond_with(@exam_result)
  end

  private
    def set_exam_result
      @exam_result = ExamResult.find(params[:id])
    end

    def exam_result_params
      params.require(:exam_result).permit(:stream_id, :exam_id, :student_id, :subject_id, :score, :grade)
    end
end
