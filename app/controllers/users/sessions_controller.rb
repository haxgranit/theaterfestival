class Users::SessionsController < Devise::SessionsController
  geocode_ip_address
end
