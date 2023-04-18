class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 3, maximum: 25 }
  # バリデーション追加
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX }
  # パスワード追加
  has_secure_password
  has_many :messages
end
