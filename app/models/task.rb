# == Schema Information
#
# Table name: tasks
#
#  id           :integer         not null, primary key
#  title        :string(200)     not null
#  body         :string(2000)    not null
#  user_id      :integer         not null
#  keep_user_id :integer         not null
#  status       :integer
#  read         :boolean
#  created_at   :datetime
#  updated_at   :datetime
#

class Task < ActiveRecord::Base
  validates_presence_of :title, :body
  
  belongs_to :user
  belongs_to :keep_user, :class_name => "User"
  has_many :task_messages
  
  STATUS_OPEN    = 0
  STATUS_REQUEST = 1 # リクエスト状態
  STATUS_FIXED   = 2 # 処理者が完了したとみなした状態
  STATUS_CLOSE   = 3 # 依頼者が完了とみなした状態
  
  def self.my_tasks(user_id)
    find(:all, :conditions => [' keep_user_id = ? and status = ? ', user_id, STATUS_OPEN])  
  end
  
  def self.request_tasks(user_id)
    find(:all, :conditions => [' user_id = ? and user_id != keep_user_id', user_id])
  end
  
  def self.fixed_tasks(user_id)
    find(:all, :conditions => [' user_id = ? and status = ? ', user_id, STATUS_FIXED])
  end
  
  def self.close_tasks(user_id)
    find(:all, :conditions => [' user_id = ? and status = ? ', user_id, STATUS_CLOSE])
  end
  
  def request?
    keep_user_id != user_id
  end
  
  def fixed
    self.status = STATUS_FIXED
  end
  
  def open
    self.status = STATUS_OPEN
  end
  
  def close
    self.status = STATUS_CLOSE
  end
  
  def all_poke_num
    Poke.sum(:num, :conditions => ["task_id = ?", self.id])
  end
end
