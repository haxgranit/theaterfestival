class ArtistsController < ApplicationController
  include Socialization::Actions
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def autocomplete
    @artists = Artist.search(params[:query], {
                              fields: ["stage_name"],
                              limit: 10,
                              load: true,
                              misspellings: {below: 5}})
    result = @artists.map do |artist|
      {stage_name: artist.stage_name,
       value: artist.id,
       credits: artist.credits
        .limit(4)
        .map do |credit|
         {production: credit.production.title,
          position: credit.position}
       end
      }
    end
    render json: result
  end

  # GET /artists
  def index
    @artists = Artist.all
  end

  # GET /artists/1
  def show
  end

  # GET /artists/new
  def new
    @artist = Artist.new
  end

  # GET /artists/1/edit
  def edit
  end

  # POST /artists
  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      redirect_to @artist, notice: 'Artist was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /artists/1
  def update
    @artist = Artist.find(params[:id])
    authorize @artist
    if @artist.update(artist_params)
      redirect_to @artist, notice: 'Artist was successfully updated.'
    else
      render :edit
    end
  end

  def claim
    if user_signed_in?
      @artist = Artist.find(params[:artist_id])
      authorize @artist
      if @artist.update(user_id: current_user.id)
        redirect_to @artist, notice: 'Artist claimed.'
        return
      end
    end
    render :show, notice: 'You don\'t have permission to do that.'
  end

  # DELETE /artists/1
  def destroy
    @artist.destroy
    redirect_to artists_url, notice: 'Artist was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def claim_params
    params.require(:artist).permit(:user_id)
  end

  # Only allow a trusted parameter "white list" through.
  def artist_params
    params.require(:artist)
      .permit(:stage_name,
              :title,
              :birthdate,
              :birth_location,
              :hometown,
              :education,
              :full_bio,
              :user_id,
              :profile_image,
              pictures_images: [],
              artist_social_metadata_attributes: [:id,
                                                  :email,
                                                  :facebook,
                                                  :instagram,
                                                  :linkedin,
                                                  :snapchat,
                                                  :tumblr,
                                                  :twitter,
                                                  :website,
                                                  :vine])
  end
end
