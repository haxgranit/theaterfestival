class UsersController < ApplicationController

  include Socialization::Actions

  def autocomplete
    @users = User.search(params[:query], {
                             fields: ["full_name"],
                             limit: 10,
                             load: true,
                             misspellings: {below: 5}})
    result = @users.map do |user|
      {full_name: user.full_name,
       value: user.id,
       email: user.email
      }
    end
    render json: result
  end


  def index
    @users = User.all
  end

  def show
    if user_signed_in?
      @user = current_user
    else
      @user = User.find(params[:id])
    end
  end


end
