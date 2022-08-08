# This migration comes from blogtype (originally 20220808043738)
class CreateBlogtypeTypeBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogtype_type_blogs do |t|
      t.string :blog_type
      t.text :description

      t.timestamps
    end
  end
end
