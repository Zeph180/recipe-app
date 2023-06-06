# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, :all
    can :manage, Recipe, author: user
    can :manage, Inventory, author: user
    can :manage, Public, author: user
    return unless user.role == 'admin'

    can :manage, :all
  end
end
