class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    check_if_admin
  end

  def create?
    return true
  end

  def edit?
    check_if_creator
  end

  def update?
    check_if_creator
  end

  def destroy?
    check_if_creator
  end

  def booking?
    return true
  end

  private

  def check_if_creator
    if user.nil? == false
      record.users.first == user
    end
  end

  def check_if_admin
    if user.nil? == false
      user.admin
    end
  end
end
