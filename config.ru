# This file is used by Rack-based servers to start the application.

require 'rack-livereload'
use Rack::LiveReload

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
