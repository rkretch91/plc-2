class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user.admin
  end

  def create?
    return true
  end

  def edit?
    record.users.first == user && user.admin
  end

  def update?
    record.users.first == user && user.admin
  end

  def destroy?
    record.users.first == user && user.admin
  end

  def booking?
    return true
  end
end
