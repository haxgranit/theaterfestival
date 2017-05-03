class ProductionPolicy < ApplicationPolicy

  attr_reader :user, :production

  def initialize(user, production)
    @user = user
    @production = production
  end

  def update?
    edit? || admin? || false
  end

  def edit?
    claim? ||
      admin? ||
      @user.all_companies.include?(@production.company) ||
      false
  end

  def claim?
    (@production.company.blank? && @user.all_companies.present?) || false
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
