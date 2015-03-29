class StreamsController < ApplicationController
  before_action :set_stream, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @streams = Stream.all
    respond_with(@streams)
  end

  def show
    respond_with(@stream)
  end

  def new
    @stream = Stream.new
    @form = Form.new
    respond_with(@stream)
  end

  def edit
  end

  def create
    @stream = Stream.new(stream_params)
    @stream.save
    respond_with(@stream)
  end

  def update
    @stream.update(stream_params)
    respond_with(@stream)
  end

  def destroy
    @stream.destroy
    respond_with(@stream)
  end

  def delete_multiple
    deleted = 0
    params[:delete_streams].split(',').each do |id|
      Stream.find_by(id: id).destroy
      deleted = deleted + 1
    end
    redirect_to streams_path, notice: "You have deleted #{deleted} streams."
  end

  def add_to_class
    added = 0
    form = Form.find_by(name: params[:form])
    if !form.nil?
      params[:streams].split(',').each do |id|
        Stream.find_by(id: id).update(form_id: form.id)
        added += 1
      end
      redirect_to streams_path, notice: "You have added #{added} streams to #{form.name}."
    else
      redirect_to streams_path, notice: "Please select a class to add the streams to."
    end
  end

  def assign
    params["stream"].split(',').each do |id|
      if params["assignee"] == "teacher"
        Stream.find_by(id: id).update(user_id: params["teacher"])
      else
        Stream.find_by(id: id).update(student_id: params["prefect"])
      end
    end
    redirect_to streams_path, notice: "You have successfully assigned."
  end

  private
    def set_stream
      @stream = Stream.find(params[:id])
    end

    def stream_params
      params.require(:stream).permit(:name, :form_id, :user_id, :student_id)
    end
end
