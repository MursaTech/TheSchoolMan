class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }

  set_current_tenant_through_filter
  before_filter :filter_tenant_via_devise_or_params
  # helper_method :forms_and_streams

  def filter_tenant_via_devise_or_params 
    # if user_signed_in?
    #   account = current_user.main_account
    #   set_current_tenant(account)
    # else params[:account].present?
    #   account = Account.find_by_email(params[:account])
    #   set_current_tenant(account)
    # end
  end

  # def forms_and_streams
  #   fc = {}
  #   streams = []
  #   Form.all.each do |f|
  #     f.streams.each do |s|
  #       streams << {s.id => s.name}
  #     end
  #     fc[f.name] = streams
  #   end
  #   fc.to_json
  # end
end
