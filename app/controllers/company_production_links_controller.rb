class CompanyProductionLinksController < ApplicationController
  before_action :set_company_production_link, only: [:show, :edit, :update, :destroy]

  # GET /company_production_links
  def index
    @company_production_links = CompanyProductionLink.all
  end

  # GET /company_production_links/1
  def show
  end

  # GET /company_production_links/new
  def new
    @company_production_link = CompanyProductionLink.new
  end

  # GET /company_production_links/1/edit
  def edit
  end

  # POST /company_production_links
  def create
    @company_production_link = CompanyProductionLink.new(company_production_link_params)

    if @company_production_link.save
      redirect_to @company_production_link, notice: 'Company production link was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /company_production_links/1
  def update
    if @company_production_link.update(company_production_link_params)
      redirect_to @company_production_link, notice: 'Company production link was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /company_production_links/1
  def destroy
    @company_production_link.destroy
    redirect_to company_production_links_url, notice: 'Company production link was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_production_link
      @company_production_link = CompanyProductionLink.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def company_production_link_params
      params.require(:company_production_link).permit(:company_id, :production_id)
    end
end
