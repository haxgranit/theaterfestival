class ProductionsController < ApplicationController
  before_action :set_production, only: [:show, :edit, :update, :destroy, :claim]

  include Socialization::Actions
  include SearchSetup

  def autocomplete
    @productions = Production.search(params[:query], {
                               fields: ["title"],
                               limit: 10,
                               load: true,
                               misspellings: {below: 5}})
    result = @productions.map do |production|
      {
        title: production.title,
        value: production.id,
        type: 'Production',
        company: production.company
      }
    end
    render json: result
  end

  def index
    redirect_to root_path
  end

  def search_internal
    set_production_search
    render :index
  end

  # GET /productions/1
  def show
  end

  def quickview
    set_production
    render :quickview, layout: false
  end

  # GET /productions/new
  def new
    @production = Production.new
  end

  # GET /productions/1/edit
  def edit
  end

  # POST /productions
  def create
    @production = Production.new
    @production.save(validate: false)

    redirect_to production_step_path(@production, Production.form_steps.first)
  end

  # PATCH/PUT /productions/1
  def update
    if @production.update(production_params)
      if @production.company_id.present?
        @production.create_activity :create, owner: @production.company
      end
      redirect_to @production, notice: 'Production was successfully updated.'
    else
      render :edit
    end
  end

  def claim
    if user_signed_in? && current_user.all_companies.present?
      @company = Company.find(params[:company])
      authorize @production
      if @production.update(company_id: @company.id)
        @production.save
        redirect_to @production, notice: 'Production claimed'
        return
      end
      render :show, notice: 'You don\'t have permission to do that.'
    end
  end

  # DELETE /productions/1
  def destroy
    @production.destroy
    redirect_to productions_url, notice: 'Production was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_production
      @production = Production.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def production_params
      params
        .require(:production)
        .permit(:title,
                :public,
                :tagline,
                :description,
                :first_performance,
                :last_performance,
                :key_image,
                :banner_image,
                :company_id,
                :archived,
                :company,
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
                                                       ]
                                   ],
                credits_attributes: [:id,
                                     :name,
                                     :position,
                                     :creditable_id,
                                     :creditable_type,
                                     :artist_id,
                                     :start_date,
                                     :end_date,
                                     :credit_type,
                                     :_destroy],
                showtimes_attributes: [:id,
                                       :theater_id,
                                       :production_id,
                                       :showtime,
                                       :_destroy],
                company_production_links_attributes: [:id, :company_id, :production_id, :_destroy],
                reviews_attributes: [:id,
                                     :production_id,
                                     :date,
                                     :rating,
                                     :title,
                                     :summary,
                                     :user_id,
                                     :full_text],
                production_metadata_attributes: [:id,
                                                 :performance_type,
                                                 :info_heading,
                                                 :info,
                                                 :warnings,
                                                 :warning_info,
                                                 :running_time,
                                                 :intermissions,
                                                 :recommended_age,
                                                 :website])
    end
end
