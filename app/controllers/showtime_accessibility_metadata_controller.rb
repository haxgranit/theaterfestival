class ShowtimeAccessibilityMetadataController < ApplicationController
  before_action :set_showtime_accessibility_metadatum, only: [:show, :edit, :update, :destroy]

  # GET /showtime_accessibility_metadata
  def index
    @showtime_accessibility_metadata = ShowtimeAccessibilityMetadata.all
  end

  # GET /showtime_accessibility_metadata/1
  def show
  end

  # GET /showtime_accessibility_metadata/new
  def new
    @showtime_accessibility_metadatum = ShowtimeAccessibilityMetadata.new
  end

  # GET /showtime_accessibility_metadata/1/edit
  def edit
  end

  # POST /showtime_accessibility_metadata
  def create
    @showtime_accessibility_metadatum = ShowtimeAccessibilityMetadata.new(showtime_accessibility_metadatum_params)

    if @showtime_accessibility_metadatum.save
      redirect_to @showtime_accessibility_metadatum, notice: 'Showtime accessibility metadata was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /showtime_accessibility_metadata/1
  def update
    if @showtime_accessibility_metadatum.update(showtime_accessibility_metadatum_params)
      redirect_to @showtime_accessibility_metadatum, notice: 'Showtime accessibility metadata was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /showtime_accessibility_metadata/1
  def destroy
    @showtime_accessibility_metadatum.destroy
    redirect_to showtime_accessibility_metadata_index_url, notice: 'Showtime accessibility metadata was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_showtime_accessibility_metadatum
      @showtime_accessibility_metadatum = ShowtimeAccessibilityMetadata.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def showtime_accessibility_metadatum_params
      params.require(:showtime_accessibility_metadatum).permit(:seat_capacity, :hearing_devices, :hearing_devices_info, :translation_devices, :translation_devices_info, :wheelchair_accessible, :wheelchair_accessible_info, :guide_dogs, :guide_dogs_info)
    end
end
