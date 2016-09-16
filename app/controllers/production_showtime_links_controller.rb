class ProductionShowtimeLinksController < ApplicationController
  before_action :set_production_showtime_link, only: [:show, :edit, :update, :destroy]

  # GET /production_showtime_links
  def index
    @production_showtime_links = ProductionShowtimeLink.all
  end

  # GET /production_showtime_links/1
  def show
  end

  # GET /production_showtime_links/new
  def new
    @production_showtime_link = ProductionShowtimeLink.new
  end

  # GET /production_showtime_links/1/edit
  def edit
  end

  # POST /production_showtime_links
  def create
    @production_showtime_link = ProductionShowtimeLink.new(production_showtime_link_params)

    if @production_showtime_link.save
      redirect_to @production_showtime_link, notice: 'Production showtime link was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /production_showtime_links/1
  def update
    if @production_showtime_link.update(production_showtime_link_params)
      redirect_to @production_showtime_link, notice: 'Production showtime link was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /production_showtime_links/1
  def destroy
    @production_showtime_link.destroy
    redirect_to production_showtime_links_url, notice: 'Production showtime link was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_production_showtime_link
      @production_showtime_link = ProductionShowtimeLink.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def production_showtime_link_params
      params.require(:production_showtime_link).permit(:production_id, :showtime_id)
    end
end
