class ShowtimeTicketMetadataController < ApplicationController
  before_action :set_showtime_ticket_metadata, only: [:show, :edit, :update, :destroy]

  # GET /showtime_ticket_metadata
  def index
    @showtime_ticket_metadata = ShowtimeTicketMetadata.all
  end

  # GET /showtime_ticket_metadata/1
  def show
  end

  # GET /showtime_ticket_metadata/new
  def new
    @showtime_ticket_metadata = ShowtimeTicketMetadata.new
  end

  # GET /showtime_ticket_metadata/1/edit
  def edit
  end

  # POST /showtime_ticket_metadata
  def create
    @showtime_ticket_metadata = ShowtimeTicketMetadata.new(showtime_ticket_metadata_params)

    if @showtime_ticket_metadata.save
      redirect_to @showtime_ticket_metadata, notice: 'Showtime ticket metadata was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /showtime_ticket_metadata/1
  def update
    if @showtime_ticket_metadata.update(showtime_ticket_metadata_params)
      redirect_to @showtime_ticket_metadata, notice: 'Showtime ticket metadata was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /showtime_ticket_metadata/1
  def destroy
    @showtime_ticket_metadata.destroy
    redirect_to showtime_ticket_metadata_index_url, notice: 'Showtime ticket metadata was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_showtime_ticket_metadata
      @showtime_ticket_metadata = ShowtimeTicketMetadata.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def showtime_ticket_metadata_params
      params.require(:showtime_ticket_metadata).permit(:guaranteed_price, :guaranteed_price_note, :ticket_link, :reservation_link, :reservation_link_info, :reservation_phone, :reservation_phone_info, :in_person_ticketing_info, :special_event, :special_event_info, :additional_ticket_type, :additional_ticket_type_price, :additional_ticket_type_info, :notes)
    end
end
