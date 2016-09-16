class TheaterMetadataController < ApplicationController
  before_action :set_theater_metadata, only: [:show, :edit, :update, :destroy]

  # GET /theater_metadata
  def index
    @theater_metadata = TheaterMetadata.all
  end

  # GET /theater_metadata/1
  def show
  end

  # GET /theater_metadata/new
  def new
    @theater_metadata = TheaterMetadata.new
  end

  # GET /theater_metadata/1/edit
  def edit
  end

  # POST /theater_metadata
  def create
    @theater_metadata = TheaterMetadata.new(theater_metadata_params)

    if @theater_metadata.save
      redirect_to @theater_metadata, notice: 'Theater metadata was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /theater_metadata/1
  def update
    if @theater_metadata.update(theater_metadata_params)
      redirect_to @theater_metadata, notice: 'Theater metadata was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /theater_metadata/1
  def destroy
    @theater_metadata.destroy
    redirect_to theater_metadata_index_url, notice: 'Theater metadata was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theater_metadata
      @theater_metadata = TheaterMetadata.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def theater_metadata_params
      params.require(:theater_metadata).permit(:theater_id, :seat_capacity, :hearing_devices, :hearing_devices_info, :translation_devices, :translation_devices_info, :wheelchair_accessible, :wheelchair_accessible_info, :guide_dogs, :guide_dogs_info)
    end
end
