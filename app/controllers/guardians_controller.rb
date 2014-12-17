class GuardiansController < ApplicationController
  before_action :set_guardian, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @guardians = Guardian.all
    respond_with(@guardians)
  end

  def show
    respond_with(@guardian)
  end

  def new
    @guardian = Guardian.new
    respond_with(@guardian)
  end

  def edit
  end

  def create
    @guardian = Guardian.new(guardian_params)
    @guardian.save
    respond_with(@guardian)
  end

  def update
    @guardian.update(guardian_params)
    respond_with(@guardian)
  end

  def destroy
    @guardian.destroy
    respond_with(@guardian)
  end

  private
    def set_guardian
      @guardian = Guardian.find(params[:id])
    end

    def guardian_params
      params.require(:guardian).permit(:name, :phone_number, :address, :id_number)
    end
end
