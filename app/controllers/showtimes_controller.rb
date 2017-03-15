class ShowtimesController < ApplicationController
  before_action :set_showtime, only: [:show, :edit, :update, :destroy]

  respond_to :html
  respond_to :js

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
    @showtime.build_showtime_accessibility_metadata
    @showtime.build_showtime_ticket_metadata
  end

  # POST /showtimes
  def create
    @showtime = Showtime.new(handle_theater)
    @showtime.save!
    @showtimes = @showtime.production.showtimes
  end

  # PATCH/PUT /showtimes/1
  def update
    @showtime.update!(handle_theater)
  end

  # DELETE /showtimes/1
  def destroy
    @showtime.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_showtime
      @showtime = Showtime.find(params[:id])
      @showtimes = @showtime.production.showtimes
    end

    # Only allow a trusted parameter "white list" through.
    def showtime_params
      params.require(:showtime).permit!
    end

    def handle_theater
      p = showtime_params[:theater_placeholder]
      showtime_params.except!(:theater_placeholder)
      if p.present?
        if p[:venue].present?
          if p[:venue_id].blank?
            c = Venue.new
            c.name = p[:venue]
            c.address = p[:address]
            c.save!(validate: false)
            if showtime_params[:theater_id] != showtime_params[:theater_id].to_i.to_s
              t = Theater.new
              t.name = showtime_params[:theater_id] || p[:venue]
              t.venue = c
              t.save!(validate: false)
              p[:theater_id] = t.id
              showtime_params[:theater_id] = p[:theater_id]
            end
          end
        end
      end
      return showtime_params
    end
end
