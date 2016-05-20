class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:email,
               :password,
               :password_confirmation,
               :current_password,
               :first_name,
               :last_name,
               :time_zone,
               :location)
    end

    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:email,
               :password,
               :password_confirmation,
               :current_password,
               :first_name,
               :last_name,
               :time_zone,
               :location)
    end
  end
end
