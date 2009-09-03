class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string  :title,        :limit => 200,  :null => false
      t.string  :body,         :limit => 2000, :null => false
      t.integer :user_id,      :null => false
      t.integer :keep_user_id, :null => false
      t.integer :status
      t.boolean :read
      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
