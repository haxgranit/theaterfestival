class TheaterPolicy < ApplicationPolicy
  attr_reader :user, :theater

  def initialize(user, theater)
    @user = user
    @artist = theater
  end

  def update?
    admin?
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
