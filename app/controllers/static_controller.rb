class StaticController < ApplicationController
  include SearchSetup

  skip_before_action :authenticate_user!

  def home
    set_production_search
  end

  def create_show
  end

end
