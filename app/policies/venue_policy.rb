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
    claim? ||
      admin? ||
      user_companies? ||
      false
  end

  def user_companies?
    if @user.present?
      @user.all_companies.include?(@venue.company)
    else
      false
    end
  end

  def claim?
    (@venue.company.blank? && @user.try(:all_companies).present? && user?) || false
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
