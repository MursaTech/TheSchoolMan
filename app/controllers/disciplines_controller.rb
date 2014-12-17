class DisciplinesController < ApplicationController
  before_action :set_discipline, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @disciplines = Discipline.all
    respond_with(@disciplines)
  end

  def show
    respond_with(@discipline)
  end

  def new
    @discipline = Discipline.new
    respond_with(@discipline)
  end

  def edit
  end

  def create
    @discipline = Discipline.new(discipline_params)
    @discipline.save
    respond_with(@discipline)
  end

  def update
    @discipline.update(discipline_params)
    respond_with(@discipline)
  end

  def destroy
    @discipline.destroy
    respond_with(@discipline)
  end

  private
    def set_discipline
      @discipline = Discipline.find(params[:id])
    end

    def discipline_params
      params.require(:discipline).permit(:student_id, :offense, :punishment, :level)
    end
end
