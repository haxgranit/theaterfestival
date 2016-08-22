class CompanyPolicy < ApplicationPolicy
  attr_reader :user, :company

  def initialize(user, company)
    @user = user
    @company = company
  end

  def update?
    admin? || edit?
  end

  def edit?
    company.user_id == user.id if user.present? || false
  end

  def claim?
    company.user.blank? if user.present? && user.company.blank? || false
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
