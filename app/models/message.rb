class Message < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  validates :user_id, presence: true
  # 該当する記事の指定
  scope :custom_display, ->(params) { where(article_id: params).order(:created_at) }
end
