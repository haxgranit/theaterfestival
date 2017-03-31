class VenuePolicy < ApplicationPolicy
  attr_reader :user, :venue

  def initialize(user, venue)
    @user = user
    @venue = venue
  end

  def update?
    edit? || admin? || false
  end

  def edit?
    @venue.company.try(:user) == @user || 
    @venue.permissions.where(user: @user).present? ||
    @venue.company.permissions.where(user: @user).present? ||
    @venue.company.blank? ||
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
