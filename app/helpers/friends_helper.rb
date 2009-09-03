module FriendsHelper
  
  def me?
    @friend.id == current_user.id
  end
end
