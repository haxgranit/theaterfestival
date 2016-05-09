class TheatersController < ApplicationController
  before_action :set_theater, only: [:show, :edit, :update, :destroy]

  # GET /theaters
  def index
    @theaters = Theater.all
  end

  # GET /theaters/1
  def show
  end

  # GET /theaters/new
  def new
    @theater = Theater.new
  end

  # GET /theaters/1/edit
  def edit
  end

  # POST /theaters
  def create
    @theater = Theater.new(theater_params)

    if @theater.save
      redirect_to @theater, notice: 'Theater was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /theaters/1
  def update
    if @theater.update(theater_params)
      redirect_to @theater, notice: 'Theater was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /theaters/1
  def destroy
    @theater.destroy
    redirect_to theaters_url, notice: 'Theater was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theater
      @theater = Theater.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def theater_params
      params.require(:theater).permit(:name, :description, :venue_id)
    end
end
