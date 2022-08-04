class ChangeStatusBlogs < ActiveRecord::Migration[7.0]
  def self.up
    change_table :blogs do |t|
      t.change :status, :string
    end
  end
  def self.down
    change_table :tablename do |t|
      t.change :status, :int
    end
  end
end
