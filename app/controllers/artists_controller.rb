class ArtistsController < ApplicationController
  include Socialization::Actions
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def autocomplete
    @artists = Artist.search(params[:query], {
                              fields: ["name"],
                              limit: 10,
                              load: true,
                              misspellings: {below: 5}})
    result = @artists.map do |artist|
      {stage_name: artist.stage_name,
       value: artist.id,
       credits: artist.credits
        .limit(4)
        .map do |credit|
         {production: credit.creditable.name,
          position: credit.position}
       end
      }
    end
    render json: result
  end

  # GET /artists
  def index
    redirect_to new_artist_path
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
    my_params = artist_params
    if my_params[:credits_attributes].present?
      credit_params = my_params[:credits_attributes]
      credit_params.each do |_, v|
        if v.fetch('creditable_id').blank? &&
           v.fetch('creditable_type') == 'Production'
          @production = Production.new
          @production.title = v.fetch('title')
          @production.first_performance = Date.today
          @production.save
          v['creditable_id'] = @production.id
        end
      end
    end
    if @artist.update(my_params)
      redirect_to @artist, notice: 'Artist was successfully updated.'
    else
      render :edit
    end
  end

  def claim
    if user_signed_in?
      @artist = Artist.find(params[:artist_id])
      if current_user.artist.present?
        @new_credits = @artist.credits
        @new_credits.each do |c|
          c.artist = current_user.artist
          c.save
        end
        @artist.destroy
        redirect_to current_user.artist, notice: 'Artists merged'
        return
      end
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
              :hometown,
              :education,
              :full_bio,
              :user_id,
              :profile_image,
              :banner_image,
              pictures_images: [],
              credits_attributes: [:id,
                                   :title,
                                   :name,
                                   :position,
                                   :creditable_id,
                                   :creditable_type,
                                   :artist_id,
                                   :start_date,
                                   :end_date,
                                   :credit_type,
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
              artist_social_metadata_attributes: [:id,
                                                  :email,
                                                  :facebook,
                                                  :instagram,
                                                  :linkedin,
                                                  :imdb,
                                                  :tumblr,
                                                  :twitter,
                                                  :website])
  end
end
