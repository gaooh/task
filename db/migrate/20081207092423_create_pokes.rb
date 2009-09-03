class CreatePokes < ActiveRecord::Migration
  def self.up
    create_table :pokes do |t|
      t.integer :user_id, :null => false
      t.integer :task_id, :null => false
      t.integer :num,     :null => false
      t.datetime :deleted_at
      t.timestamps
    end
  end

  def self.down
    drop_table :pokes
  end
end
