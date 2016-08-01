module Socialization::Actions
  extend ActiveSupport::Concern

  included do
    before_action :load_target
  end

  def load_target
    resource, id = request.path.split('/')[1,2]
    @target = resource.singularize.classify.constantize.find(id)
  end

  def like
    current_user.like!(@target)
    redirect_to :back, notice: "Liked this user successfully!"
  end

  def follow
    current_user.follow!(@target)
    redirect_to :back, notice: "Followed this user successfully!"
  end

  def unlike
    current_user.unlike!(@target)
    redirect_to :back, notice: "Unliked this user successfully!"
  end

  def unfollow
    current_user.unfollow!(@target)
    redirect_to :back, notice: "Unfollowed this user successfully!"
  end

end
