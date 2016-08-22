class ProductionPolicy < ApplicationPolicy

  attr_reader :user, :production

  def initialize(user, production)
    @user = user
    @production = production
  end

  def update?
    admin? || edit?
  end

  def edit?
    true
  end

  def claim?
    true
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
