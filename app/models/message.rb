class Message < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  validates :user_id, presence: true
  scope :custom_display, ->(params) { where(article_id: params).order(:created_at).last(20) }
end
