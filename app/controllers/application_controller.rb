class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  set_current_tenant_through_filter
  before_filter :filter_tenant_via_devise_or_params

  def filter_tenant_via_devise_or_params 
    if user_signed_in?
      account = current_user.main_account
      set_current_tenant(account)
    else params[:account].present?
      account = Account.find_by_email(params[:account])
      set_current_tenant(account)
    end
  end
end
