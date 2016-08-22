class ArtistPolicy < ApplicationPolicy
  attr_reader :user, :artist

  def initialize(user, artist)
    @user = user
    @artist = artist
  end

  def update?
    admin? || edit? || true
  end

  def edit?
    artist.user_id == user.id if user.present? || true
  end

  def claim?
    if user.present? && user.artist.blank?
      artist.user.blank?
    else
      false
    end
  end

  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
