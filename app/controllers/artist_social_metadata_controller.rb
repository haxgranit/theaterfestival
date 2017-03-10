class ArtistSocialMetadataController < ApplicationController
  before_action :set_artist_social_metadata, only: [:show, :edit, :update, :destroy]

  # GET /artist_social_metadata
  def index
    @artist_social_metadata = ArtistSocialMetadata.all
  end

  # GET /artist_social_metadata/1
  def show
  end

  # GET /artist_social_metadata/new
  def new
    @artist_social_metadata = ArtistSocialMetadata.new
  end

  # GET /artist_social_metadata/1/edit
  def edit
  end

  # POST /artist_social_metadata
  def create
    @artist_social_metadata = ArtistSocialMetadata.new(artist_social_metadata_params)

    if @artist_social_metadata.save
      redirect_to @artist_social_metadata, notice: 'Artist social metadata was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /artist_social_metadata/1
  def update
    if @artist_social_metadata.update(artist_social_metadata_params)
      redirect_to @artist_social_metadata, notice: 'Artist social metadata was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /artist_social_metadata/1
  def destroy
    @artist_social_metadata.destroy
    redirect_to artist_social_metadata_index_url, notice: 'Artist social metadata was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist_social_metadata
      @artist_social_metadata = ArtistSocialMetadata.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def artist_social_metadata_params
      params
        .require(:artist_social_metadata)
        .permit(:twitter,
                :facebook,
                :linkedin,
                :tumblr,
                :imdb,
                :email,
                :website,
                :instagram,
                :artist_id)
    end
end
