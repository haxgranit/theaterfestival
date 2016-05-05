class CompanySocialMetadataController < ApplicationController
  before_action :set_company_social_metadatum, only: [:show, :edit, :update, :destroy]

  # GET /company_social_metadata
  def index
    @company_social_metadata = CompanySocialMetadata.all
  end

  # GET /company_social_metadata/1
  def show
  end

  # GET /company_social_metadata/new
  def new
    @company_social_metadatum = CompanySocialMetadata.new
  end

  # GET /company_social_metadata/1/edit
  def edit
  end

  # POST /company_social_metadata
  def create
    @company_social_metadatum = CompanySocialMetadata.new(company_social_metadatum_params)

    if @company_social_metadatum.save
      redirect_to @company_social_metadatum, notice: 'Company social metadata was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /company_social_metadata/1
  def update
    if @company_social_metadatum.update(company_social_metadatum_params)
      redirect_to @company_social_metadatum, notice: 'Company social metadata was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /company_social_metadata/1
  def destroy
    @company_social_metadatum.destroy
    redirect_to company_social_metadata_index_url, notice: 'Company social metadata was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_social_metadatum
      @company_social_metadatum = CompanySocialMetadata.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def company_social_metadatum_params
      params.require(:company_social_metadatum).permit(:twitter, :facebook, :linkedin, :tumblr, :vine, :snapchat, :instagram)
    end
end
