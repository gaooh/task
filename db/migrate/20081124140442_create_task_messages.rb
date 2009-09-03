class CreateTaskMessages < ActiveRecord::Migration
  def self.up
    create_table :task_messages do |t|
      t.text    :body,    :limit => 2000, :null => false
      t.boolean :read,    :null => false
      t.integer :user_id, :null => false
      t.integer :task_id, :null => false
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def self.down
    drop_table :task_messages
  end
end
