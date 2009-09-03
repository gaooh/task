# == Schema Information
#
# Table name: task_messages
#
#  id         :integer         not null, primary key
#  body       :text(2000)      not null
#  read       :boolean         not null
#  user_id    :integer         not null
#  task_id    :integer         not null
#  deleted_at :datetime
#  created_at :datetime
#  updated_at :datetime
#

class TaskMessage < ActiveRecord::Base
  belongs_to :task
  belongs_to :user
end
