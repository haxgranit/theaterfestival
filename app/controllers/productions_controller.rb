class ProductionsController < ApplicationController
  before_action :set_production, only: [:show, :edit, :update, :destroy]

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

  def search_internal
    set_production_search
    render :index
  end


  # GET /productions/1
  def show
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
    @production = Production.new(production_params)

    if @production.save
      if @production.company_id.present?
        @production.create_activity :create, owner: @production.company
      end
      redirect_to @production, notice: 'Production was successfully created.'
    else
      render :new
    end
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
                :company_id,
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
                                                        :photo
                                                       ]
                                   ],
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
