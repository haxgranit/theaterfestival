class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:show, :index, :autocomplete, :search_internal, :quickview]
  before_action :get_session_location


  private

  def get_session_location
    session[:geo_location] ||= retrieve_location_from_service
  end

  def retrieve_location_from_service
    logger.debug 'Geolocation performed'
    location = Geokit::Geocoders::MultiGeocoder.geocode(get_ip_address)
    location.success ? location : nil
  end

  def get_ip_address
    request.remote_ip
  end

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
                                             :public,
                                             :profile_image,
                                             :banner_image])

    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [:first_name,
                                             :last_name,
                                             :time_zone,
                                             :location,
                                             :public,
                                             :profile_image,
                                             :banner_image])
  end

end
