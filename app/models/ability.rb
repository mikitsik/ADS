# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new.tap {|user| user.role = 'guest'}

    if user.guest?
      can :read, Advertisement, state: :published
    elsif user.user?
      can [:read, :create], Advertisement, user_id: user.id
      can :manage, Advertisement, state: :draft, user_id: user.id
      can [:read, :destroy], Advertisement, state: :new, user_id: user.id
      can :destroy, Advertisement, state: :approved, user_id: user.id
      can :destroy, Advertisement, state: :published, user_id: user.id
    elsif user.admin?
      can :destroy, Advertisement
      can :manage, User
    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
