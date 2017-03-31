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
    claim? || admin? || false
  end

  def claim?
    production.company.blank? || false
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
