class Add < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :article_id, :integer, null: false
  end
end
