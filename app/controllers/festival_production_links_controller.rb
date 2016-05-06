class FestivalProductionLinksController < ApplicationController
  before_action :set_festival_production_link, only: [:show, :edit, :update, :destroy]

  # GET /festival_production_links
  def index
    @festival_production_links = FestivalProductionLink.all
  end

  # GET /festival_production_links/1
  def show
  end

  # GET /festival_production_links/new
  def new
    @festival_production_link = FestivalProductionLink.new
  end

  # GET /festival_production_links/1/edit
  def edit
  end

  # POST /festival_production_links
  def create
    @festival_production_link = FestivalProductionLink.new(festival_production_link_params)

    if @festival_production_link.save
      redirect_to @festival_production_link, notice: 'Festival production link was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /festival_production_links/1
  def update
    if @festival_production_link.update(festival_production_link_params)
      redirect_to @festival_production_link, notice: 'Festival production link was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /festival_production_links/1
  def destroy
    @festival_production_link.destroy
    redirect_to festival_production_links_url, notice: 'Festival production link was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_festival_production_link
      @festival_production_link = FestivalProductionLink.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def festival_production_link_params
      params.require(:festival_production_link).permit(:festival_id, :production_id)
    end
end
