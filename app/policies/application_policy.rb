class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    admin? || false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    admin? || false
  end

  def new?
    admin? || create?
  end

  def update?
    admin? || false
  end

  def edit?
    admin? || update?
  end

  def destroy?
    admin? || false
  end

  def admin?
    user.admin?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
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
