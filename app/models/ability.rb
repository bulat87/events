class Ability
  include CanCan::Ability

  def initialize(user)  
    user ||= User.new  
  
    if user   
      can :delete, Comment  
      can :update, :delete Event do |event|  
        event.try(:user) == user  
      end   
    end  
  end  
end