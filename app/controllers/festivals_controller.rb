class FestivalsController < ApplicationController
  before_action :set_festival, only: [:show, :edit, :update, :destroy]

  def autocomplete
    render json: Festival.search(params[:query], {
                                  fields: ["title"],
                                  limit: 10,
                                  load: false,
                                  misspellings: {below: 5}
                                }).map { |festival| { title: festival.title,
                                                     value: festival.id } }
  end

  # GET /festivals
  def index
    @festivals = Festival.all
  end

  # GET /festivals/1
  def show
  end

  # GET /festivals/new
  def new
    @festival = Festival.new
  end

  # GET /festivals/1/edit
  def edit
  end

  # POST /festivals
  def create
    @festival = Festival.new(festival_params)

    if @festival.save
      redirect_to @festival, notice: 'Festival was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /festivals/1
  def update
    if @festival.update(festival_params)
      redirect_to @festival, notice: 'Festival was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /festivals/1
  def destroy
    @festival.destroy
    redirect_to festivals_url, notice: 'Festival was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_festival
      @festival = Festival.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def festival_params
      params.require(:festival).permit(:title,
                                       :subtitle,
                                       :festival_image,
                                       :banner_image,
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
                                                                              ]])
    end
end
