class ProductionMetadataController < ApplicationController
  before_action :set_production_metadata, only: [:show, :edit, :update, :destroy]

  # GET /production_metadata
  def index
    @production_metadata = ProductionMetadata.all
  end

  # GET /production_metadata/1
  def show
  end

  # GET /production_metadata/new
  def new
    @production_metadata = ProductionMetadata.new
  end

  # GET /production_metadata/1/edit
  def edit
  end

  # POST /production_metadata
  def create
    @production_metadata = ProductionMetadata.new(production_metadata_params)

    if @production_metadata.save
      redirect_to @production_metadata, notice: 'Production metadata was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /production_metadata/1
  def update
    if @production_metadata.update(production_metadata_params)
      redirect_to @production_metadata, notice: 'Production metadata was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /production_metadata/1
  def destroy
    @production_metadata.destroy
    redirect_to production_metadata_index_url, notice: 'Production metadata was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_production_metadata
      @production_metadata = ProductionMetadata.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def production_metadata_params
      params.require(:production_metadata).permit(:production_id, :performance_type, :info_heading, :info, :warnings, :warning_info, :running_time, :intermissions)
    end
end
