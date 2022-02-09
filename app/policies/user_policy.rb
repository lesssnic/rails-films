class UserPolicy < ApplicationPolicy
  def index?
    user.admin_role?
  end

  def show?
    true
  end

  def create?
    user.admin_role?
  end

  def update?
    user.admin_role?
  end

  def destroy?
    user.admin_role?
  end
end
