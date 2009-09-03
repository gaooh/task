# == Schema Information
#
# Table name: pokes
#
#  id         :integer         not null, primary key
#  user_id    :integer         not null
#  task_id    :integer         not null
#  num        :integer         not null
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Poke < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
end
