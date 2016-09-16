class TheatersController < ApplicationController
  before_action :set_theater, only: [:show, :edit, :update, :destroy]

  def autocomplete
    render json: Theater.search(params[:query], {
                                 fields: ["name"],
                                 limit: 10,
                                 load: true,
                                 misspellings: {below: 5}
                               }).map { |theater| { name: theater.name,
                                                    value: theater.id,
                                                    venue: theater.venue.name } }
  end

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
      redirect_to @theater.venue, notice: 'Theater was successfully updated.'
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
      params
        .require(:theater)
        .permit(:name,
                :description,
                :venue_id,
                theater_metadata_attributes: [:id,
                                              :theater_id,
                                              :seat_capacity,
                                              :hearing_devices,
                                              :hearing_devices_info,
                                              :translation_services,
                                              :translation_services_info,
                                              :wheelchair_accessible,
                                              :wheelchair_accessible_info])
    end
end
