class TheaterPolicy < ApplicationPolicy
  attr_reader :user, :theater

  def initialize(user, theater)
    @user = user
    @theater = theater
  end

  def update?
    edit? || admin? || false
  end

  def edit?
    @theater.permissions.where(user: @user).present? ||
    @theater.venue.permissions.where(user: @user).present? ||
    @theater.venue.company.permissions.where(user: @user).present? ||
    @theater.venue.company.blank? ||
    false
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
