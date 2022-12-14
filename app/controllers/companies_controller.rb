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
    redirect_to new_company_path
  end

  # GET /companies/1
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
    if params[:create_show] == 'true'
      @user = current_user
    end
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
    if handle_credits
      redirect_to @company, notice: 'Company was successfully updated.'
    else
      redirect_to @company, notice: 'Something went wrong. Please try again.'
    end
  end

  def claim
    if user_signed_in?
      @company = Company.find(params[:company_id])
      authorize @company
      if @company.update(user_id: current_user.id)
        @company.save
        redirect_to @company, notice: 'Company claimed.'
        return
      end
    end
    render :show, notice: 'You don\'t have permission to do that.'
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

    def handle_credits
      p = company_params
      if p['credits_attributes'].present? 
        pc = p['credits_attributes']
	pc.each do |_, v|
	  if v[:stage_name].present? && v[:artist_id].blank?
	    a = Artist.new
	    a.stage_name = v[:stage_name]
            a.save!(validate: false)
	    v[:artist_id] = a.id
	  end
	  v[:start_date] = Date.strptime(v[:start_date], '%m/%d/%Y')
	  v[:end_date] = Date.strptime(v[:end_date], '%m/%d/%Y') if v[:end_date].present?
	  v.except!('stage_name')
	end
        final_credit = p.merge!(credits_attributes: pc)
        @company.update!(final_credit)
      else
        @company.update(p)
      end
    end 

    # Only allow a trusted parameter "white list" through.
    def company_params
      params.require(:company)
        .permit(:name,
                :company_type,
                :website,
                :description,
                :email,
                :company_image,
                :banner_image,
                :user_id,
                productions_attributes: [:id,
                                         :title,
                                         :key_image,
                                         :banner_image,
                                         :public,
                                         :description,
                                         :first_performance,
                                         :last_performance,
                                         :_destroy],
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
                credits_attributes: [:id,
                                     :stage_name,
                                     :position,
                                     :creditable_id,
                                     :creditable_type,
                                     :artist_id,
                                     :start_date,
                                     :end_date,
                                     :credit_type,
                                     :_destroy],
                venues_attributes: [:id,
                                     :name,
                                     :venue_image,
                                     :banner_image,
                                     :website,
                                     :phone_number,
                                     :description,
                                     :time_zone,
                                     :address,
                                     :city,
                                     :state,
                                     :zip,
                                     :_destroy],

                albums_attributes: [:id,
                                    :title,
                                    :description,
                                    :has_album_id,
                                    :has_album_type,
                                    :_destroy,
                                    photos_attributes: [:id,
                                                        :title,
                                                        :description,
                                                        :credit,
                                                        :photo_date,
                                                        :photo_album_id,
                                                        :photo,
                                                        :_destroy
                                                       ]],
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
