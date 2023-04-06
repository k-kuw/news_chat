class AddRestrictToArticle < ActiveRecord::Migration[7.0]
  def change
    change_column :articles, :category_id, :integer, null: false
  end
end
