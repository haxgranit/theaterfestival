class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:show, :index]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:email,
                                             :password,
                                             :password_confirmation,
                                             :first_name,
                                             :last_name,
                                             :time_zone,
                                             :location,
                                             :profile_image])

    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [:first_name,
                                             :last_name,
                                             :time_zone,
                                             :location,
                                             :profile_image])
  end

end
