class ShowtimesController < ApplicationController
  before_action :set_showtime, only: [:show, :edit, :update, :destroy]

  # GET /showtimes
  def index
    @showtimes = Showtime.all
  end

  # GET /showtimes/1
  def show
  end

  # GET /showtimes/new
  def new
    @showtime = Showtime.new
    @showtime.build_showtime_accessibility_metadata
    @showtime.build_showtime_ticket_metadata
  end

  # GET /showtimes/1/edit
  def edit
  end

  # POST /showtimes
  def create
    @showtime = Showtime.new(showtime_params)

    if @showtime.save
      redirect_to :back, notice: 'Showtime was successfully created.'
    else
      render :back
    end
  end

  # PATCH/PUT /showtimes/1
  def update
    if @showtime.update(showtime_params)
      redirect_to :back, notice: 'Showtime was successfully updated.'
    else
      render :back
    end
  end

  # DELETE /showtimes/1
  def destroy
    @showtime.destroy
    redirect_to showtimes_url, notice: 'Showtime was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_showtime
      @showtime = Showtime.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def showtime_params
      params.require(:showtime).permit(:showtime, :theater_id)
    end
end
