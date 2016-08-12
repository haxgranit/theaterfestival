module Socialization::Actions
  extend ActiveSupport::Concern

  included do
    before_action :load_target, only: [:like, :unlike, :follow, :unfollow]
  end

  def load_target
    resource, resource_id = request.path.split('/')[1,2]
    @target = resource.singularize.classify.constantize.find(resource_id)
  end

  def like
    current_user.like!(@target)
    @target.create_activity key: "#{@target.class.to_s.downcase}.like", owner: current_user
    redirect_to :back, notice: "Liked this user successfully!"
  end

  def follow
    current_user.follow!(@target)
    @target.create_activity key: "#{@target.class.to_s.downcase}.follow", owner: current_user
    redirect_to :back, notice: "Followed this user successfully!"
  end

  def unlike
    current_user.unlike!(@target)
    @target.create_activity key: "#{@target.class.to_s.downcase}.unlike", owner: current_user
    redirect_to :back, notice: "Unliked this user successfully!"
  end

  def unfollow
    current_user.unfollow!(@target)
    @target.create_activity key: "#{@target.class.to_s.downcase}.unfollow", owner: current_user
    redirect_to :back, notice: "Unfollowed this user successfully!"
  end

end
