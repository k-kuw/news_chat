class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.text :title, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end
