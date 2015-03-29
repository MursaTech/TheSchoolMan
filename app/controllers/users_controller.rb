class UsersController < ApplicationController
  # before_filter :is_user_admin?, only: [:create, :update, :destroy]
  # after_action :add_user_to_account, only: [:create]
  # before_filter :authenticate_user!

  def index
    @new_user = User.new
    if params[:user_type] == 'teachers'
    	@users = User.where(user_type: "Teacher")
    elsif params[:user_type] == 'non-teaching'
      @users = User.where.not(user_type: "Teacher")
    else
    	@users = User.all#ActsAsTenant.current_tenant.users if !ActsAsTenant.current_tenant.nil?
    end
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user || current_user.is_admin
      redirect_to users_path, :alert => "Access denied."
    end
  end

  def create
    @user = User.new(user_params)
    @user.password = "12345678"#generate_random_password
    @user.is_admin = user_params[:is_admin] == "1"
    # @user.email = "#{@user.name.gsub(' ', '_')}@gmail.com"

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { redirect_to users_path, alert: "User could not be added!" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def is_user_admin?
      unless current_user.is_admin
        redirect_to users_path, alert: "You are not authorized to add users!"
      end
    end

  def user_params
    params.require(:user).permit(:name, :phone_number, :email, :id_number, :address, :is_admin, :user_type, :is_admin)
  end
end
