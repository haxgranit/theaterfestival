class PhotoAlbumsController < ApplicationController
  before_action :set_album, only: [:update, :destroy]
  before_action :set_source, only: [:update, :destroy]


  def update
    if @album.update(album_params)
      redirect_to @source, notice: 'Album was successfully updated.'
    else
      redirect_to @source, notice: 'There was an error with your upload.'
    end
  end

  def destroy
    @album.destroy
    redirect_to polymorphic_path(@source), notice: 'Album was successfully destroyed.'
  end

  def set_album
    @album = PhotoAlbum.find(params[:id])
  end

  def set_source
    resource, resource_id = request.path.split('/')[1,2]
    @source = resource.singularize.classify.constantize.find(resource_id)
  end

  def album_params
    params.require(:photo_album)
      .permit(:id,
              :title,
              :description,
              :has_album_id,
              :has_album_type,
              photos_attributes: [:id,
                                  :title,
                                  :description,
                                  :credit,
                                  :photo_date,
                                  :photo_album_id,
                                  :photo,
                                  :_destroy
                                 ])
  end
end
