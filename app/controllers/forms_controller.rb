class FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @forms = Form.all
    respond_with(@forms)
  end

  def show
    respond_with(@form)
  end

  def new
    @form = Form.new
    respond_with(@form)
  end

  def edit
  end

  def create
    @form = Form.new(form_params)
    @form.save
    respond_with(@form)
  end

  def update
    @form.update(form_params)
    respond_with(@form)
  end

  def destroy
    @form.destroy
    respond_with(@form)
  end

  private
    def set_form
      @form = Form.find(params[:id])
    end

    def form_params
      params.require(:form).permit(:name)
    end
end
