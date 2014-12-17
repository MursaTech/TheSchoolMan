class SubjectAllocationsController < ApplicationController
  before_action :set_subject_allocation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @subject_allocations = SubjectAllocation.all
    respond_with(@subject_allocations)
  end

  def show
    respond_with(@subject_allocation)
  end

  def new
    @subject_allocation = SubjectAllocation.new
    respond_with(@subject_allocation)
  end

  def edit
  end

  def create
    @subject_allocation = SubjectAllocation.new(subject_allocation_params)
    @subject_allocation.save
    respond_with(@subject_allocation)
  end

  def update
    @subject_allocation.update(subject_allocation_params)
    respond_with(@subject_allocation)
  end

  def destroy
    @subject_allocation.destroy
    respond_with(@subject_allocation)
  end

  private
    def set_subject_allocation
      @subject_allocation = SubjectAllocation.find(params[:id])
    end

    def subject_allocation_params
      params.require(:subject_allocation).permit(:stream_id, :subject_id, :user_id)
    end
end
