class AddPublishColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :blogs, :status, :string
    add_column :blogs, :publish, :boolean
  end
end
