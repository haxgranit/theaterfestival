class CreditsController < ApplicationController

  before_action :set_credit, only: [:show, :edit, :update, :destroy]
  before_action :set_credits_list, only: [:show]

  include Socialization::Actions

  respond_to :html
  respond_to :js

  # GET /showtimes
  def index
    @credits = Credit.all
  end

  # GET /showtimes/1
  def show
  end

  # GET /showtimes/new
  def new
    @edit = false
    @credit = Credit.new
  end

  # GET /showtimes/1/edit
  def edit
    @edit = true
  end

  # POST /showtimes
  def create
    @credit = Credit.new(handle_background_objects)
    @credit.save!
  end

  # PATCH/PUT /showtimes/1
  def update
    @credit.update!(handle_background_objects)
  end

  # DELETE /showtimes/1
  def destroy
    @credit.destroy
  end

  private
  def set_credit
    @credit = Credit.find(params[:id])
  end

  def credit_params
    params.require(:credit).permit!
  end

  def set_credits_list
    case credit_params[:credit_type]
    when 'production'
      @credits = @production.credits.production
      @credit_type = :production
    when 'creative'
      @credits = @production.credits.creative
      @credit_type = :creative
    when 'staff'
      @credits = @production.credits.staff
      @credit_type = :staff
    when 'other'
      @credits = @production.credits.other
      @credit_type = :other
    end
  end

  def handle_background_objects
    if credit_params[:artist_id].blank? && credit_params[:stage_name].present?
      artist = Artist.new(stage_name: credit_params[:stage_name])
      artist.save!
      credit_params[:artist_id] = artist.id
    end
    credit_params[:start_date] = Date.strptime(credit_params[:start_date], "%m/%d/%Y")
    unless credit_params[:end_date].blank?
      credit_params[:end_date] = Date.strptime(credit_params[:end_date], "%m/%d/%Y")
    end
    credit_params.except!(:stage_name)
  end
end
