class ProducerPolicy < ApplicationPolicy
  def index?
    true
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
