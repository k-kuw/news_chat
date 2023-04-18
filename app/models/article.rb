class Article < ApplicationRecord
  belongs_to :category
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 20, maximum: 300 }
  validates :category_id, presence: true
  # 1枚の画像を持つ
  has_one_attached :photo do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
end
