# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, User
    can :read, Post

    if user
      can :edit, User, id: user.id
      can :edit, Post, author_id: user.id
    end

    # deletable
    [User, Post].each do |klass|
      cannot :manage, klass, is_available: nil
    end
    cannot :manage, Post, author: { is_available: nil }
  end
end
