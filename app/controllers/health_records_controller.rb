class HealthRecordsController < ApplicationController
  before_action :set_health, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @health_records = HealthRecord.all
    respond_with(@health_records)
  end

  def show
    respond_with(@health_record)
  end

  def new
    @health_record = HealthRecord.new
    respond_with(@health_record)
  end

  def edit
  end

  def create
    @health_record = HealthRecord.new(health_params)
    @health_record.save
    respond_with(@health_record)
  end

  def update
    @health_record.update(health_params)
    respond_with(@health_record)
  end

  def destroy
    @health_record.destroy
    respond_with(@health_record)
  end

  private
    def set_health
      @health_record = HealthRecord.find(params[:id])
    end

    def health_params
      params.require(:health).permit(:student_id, :diagonosis, :prescription, :need_for_outside_referral, :user_id)
    end
end
