class CompanyMetadataController < ApplicationController
  before_action :set_company_metadata, only: [:show, :edit, :update, :destroy]

  # GET /company_metadata
  def index
    @company_metadata = CompanyMetadata.all
  end

  # GET /company_metadata/1
  def show
  end

  # GET /company_metadata/new
  def new
    @company_metadata = CompanyMetadata.new
  end

  # GET /company_metadata/1/edit
  def edit
  end

  # POST /company_metadata
  def create
    @company_metadata = CompanyMetadata.new(company_metadata_params)

    if @company_metadata.save
      redirect_to @company_metadata, notice: 'Company metadata was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /company_metadata/1
  def update
    if @company_metadata.update(company_metadata_params)
      redirect_to @company_metadata, notice: 'Company metadata was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /company_metadata/1
  def destroy
    @company_metadata.destroy
    redirect_to company_metadata_index_url, notice: 'Company metadata was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_metadata
      @company_metadata = CompanyMetadata.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def company_metadata_params
      params.require(:company_metadata).permit(:company_id,
                                               :address1,
                                               :address2,
                                               :date_founded,
                                               :location_founded,
                                               :founders,
                                               :mission,
                                               :history)
    end
end
