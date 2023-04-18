class AddPhotoToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :photo, :binary, default: nil
  end
end
