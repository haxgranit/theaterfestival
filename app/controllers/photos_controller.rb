class PhotosController < ApplicationController
  before_action :set_photo, only: [:destroy]
  before_action :set_source, only: [:destroy]

  def destroy
    @photo.destroy
    redirect_to polymorphic_path(@source), notice: 'Photo was successfully destroyed.'
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def set_source
    resource, resource_id = request.path.split('/')[1,2]
    @source = resource.singularize.classify.constantize.find(resource_id)
  end
end
