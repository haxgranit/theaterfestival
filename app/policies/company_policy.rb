class CompanyPolicy < ApplicationPolicy
  attr_reader :user, :company

  def initialize(user, company)
    @user = user
    @company = company
  end

  def update?
    admin? || claim?
  end

  def edit?
    company.permissions.where(user: @user).present? || claim? || admin? || false
  end

  def claim?
    company.user.blank?
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
