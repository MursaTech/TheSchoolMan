class HealthsController < ApplicationController
  before_action :set_health, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @healths = Health.all
    respond_with(@healths)
  end

  def show
    respond_with(@health)
  end

  def new
    @health = Health.new
    respond_with(@health)
  end

  def edit
  end

  def create
    @health = Health.new(health_params)
    @health.save
    respond_with(@health)
  end

  def update
    @health.update(health_params)
    respond_with(@health)
  end

  def destroy
    @health.destroy
    respond_with(@health)
  end

  private
    def set_health
      @health = Health.find(params[:id])
    end

    def health_params
      params.require(:health).permit(:student_id, :diagonosis, :prescription, :need_for_outside_referral, :user_id)
    end
end
