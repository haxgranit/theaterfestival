class CompanyFestivalLinksController < ApplicationController
  before_action :set_company_festival_link, only: [:show, :edit, :update, :destroy]

  # GET /company_festival_links
  def index
    @company_festival_links = CompanyFestivalLink.all
  end

  # GET /company_festival_links/1
  def show
  end

  # GET /company_festival_links/new
  def new
    @company_festival_link = CompanyFestivalLink.new
  end

  # GET /company_festival_links/1/edit
  def edit
  end

  # POST /company_festival_links
  def create
    @company_festival_link = CompanyFestivalLink.new(company_festival_link_params)

    if @company_festival_link.save
      redirect_to @company_festival_link, notice: 'Company festival link was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /company_festival_links/1
  def update
    if @company_festival_link.update(company_festival_link_params)
      redirect_to @company_festival_link, notice: 'Company festival link was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /company_festival_links/1
  def destroy
    @company_festival_link.destroy
    redirect_to company_festival_links_url, notice: 'Company festival link was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_festival_link
      @company_festival_link = CompanyFestivalLink.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def company_festival_link_params
      params.require(:company_festival_link).permit(:company_id, :festival_id)
    end
end
