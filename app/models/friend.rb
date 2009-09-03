# == Schema Information
#
# Table name: friends
#
#  id             :integer         not null, primary key
#  user_id        :integer         not null
#  friend_user_id :integer         not null
#  created_at     :datetime
#  updated_at     :datetime
#

class Friend < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend_user, :class_name => "User"
end
