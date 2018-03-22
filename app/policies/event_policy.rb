class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def edit?
    record.users.first == user
  end

  def update?
    record.users.first == user
  end

  def destroy?
    record.users.first == user
  end

  def booking?
    return true
  end
end
