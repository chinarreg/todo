class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_charts_date

  layout :layout_by_controller
  
  def get_charts_date
    @charts_data = Task.all.group(:status).count.to_a
  end

  protected

  def layout_by_controller
    devise_controller? ? 'devise' : 'application'
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:roles, :email, :password, :password_confirmation)
    end
  end  
end
