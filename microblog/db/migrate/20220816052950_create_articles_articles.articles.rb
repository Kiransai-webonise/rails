# This migration comes from articles (originally 20220816050428)
class CreateArticlesArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles_articles do |t|
      t.string :title
      t.text :text
      t.string :status
      t.string :is_published

      t.timestamps
    end
  end
end
