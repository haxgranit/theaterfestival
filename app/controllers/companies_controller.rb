class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  include Socialization::Actions

  def autocomplete
    render json: Company.search(params[:query], {
                                  fields: ["name"],
                                  limit: 10,
                                  load: false,
                                  misspellings: {below: 5}
                                }).map { |company| { name: company.name,
                                                     value: company.id } }
  end

  # GET /companies
  def index
    @companies = Company.all
  end

  # GET /companies/1
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to @company, notice: 'Company was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      redirect_to @company, notice: 'Company was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
    redirect_to companies_url, notice: 'Company was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def company_params
      params.require(:company)
        .permit(:name,
                :companytype,
                :website,
                :description,
                :email,
                :company_image,
                company_social_metadata_attributes: [:id,
                                                     :email,
                                                     :facebook,
                                                     :instagram,
                                                     :linkedin,
                                                     :snapchat,
                                                     :tumblr,
                                                     :twitter,
                                                     :website,
                                                     :vine],
                company_metadata_attributes: [:id,
                                              :address1,
                                              :address2,
                                              :date_founded,
                                              :location_founded,
                                              :founders,
                                              :mission,
                                              :history]
               )
    end
end
