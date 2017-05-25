class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy, :claim]
  include Socialization::Actions

  def autocomplete
    render json: Venue.search(params[:query], {
        fields: ["name"],
        limit: 10,
        load: true,
        misspellings: {below: 5}
    }).map { |venue| { name: venue.name,
                         value: venue.id } }
  end

  # GET /venues
  def index
    @venues = Venue.all
  end

  # GET /venues/1
  def show
  end

  # GET /venues/new
  def new
    @venue = Venue.new
  end

  # GET /venues/1/edit
  def edit
  end

  # POST /venues
  def create
    @venue = Venue.new(venue_params)

    if @venue.save
      redirect_to @venue, notice: 'Venue was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /venues/1
  def update
    if @venue.update(venue_params)
      redirect_to @venue, notice: 'Venue was successfully updated.'
    else
      render :edit
    end
  end

  def claim
    if user_signed_in? && current_user.all_companies.present?
      @company = Company.find(params[:company])
      authorize @venue
      if @venue.update(company_id: @company.id)
        @venue.save
        redirect_to @venue, notice: 'Venue claimed'
        return
      end
      render :show, notice: 'You don\'t have permission to do that.'
    end
  end

  # DELETE /venues/1
  def destroy
    @venue.destroy
    redirect_to venues_url, notice: 'Venue was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue
      @venue = Venue.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def venue_params
      params.require(:venue)
        .permit(:name,
                :address1,
                :address2,
                :website,
                :phone_number,
                :description,
                :venue_image,
                :banner_image,
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
                                                        :photo,
                                                        :_destroy
                                                       ]],
                theaters_attributes: [:id,
                                      :name,
                                      :description,
                                      :venue_id,
                                      :_destroy],
                showtimes_attributes: [:id,
                                       :title,
                                       :production_id,
                                       :showtime,
                                       :theater_id,
                                       :_destroy])
    end
end
