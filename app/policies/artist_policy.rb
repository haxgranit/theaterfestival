class ArtistPolicy < ApplicationPolicy
  attr_reader :user, :artist

  def initialize(user, artist)
    @user = user
    @artist = artist
  end

  def update?
    admin? || (artist.user_id == user.id if user.present?)
  end

  def edit?
    update?
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
