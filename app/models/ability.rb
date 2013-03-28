class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :checkout, Cart
    end

  end

end
