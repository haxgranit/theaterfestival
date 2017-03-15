class ProductionPolicy < ApplicationPolicy

  attr_reader :user, :production

  def initialize(user, production)
    @user = user
    @production = production
  end

  def update?
    admin? || claim?
  end

  def edit?
    production.permissions.where(user: @user).present? || false
  end

  def claim?
    production.permissions.blank? if user.present? || edit?
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
