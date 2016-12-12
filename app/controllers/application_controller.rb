class ApplicationController < ActionController::Base
  geocode_ip_address
  include Pundit
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:show, :index, :autocomplete, :search_internal, :quickview]

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
                                             :profile_image,
                                             :banner_image])

    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [:first_name,
                                             :last_name,
                                             :time_zone,
                                             :location,
                                             :profile_image,
                                             :banner_image])
  end

end
