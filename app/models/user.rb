class User < ApplicationRecord
  validates :name, presence: true, length: {in: 1..15}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}
  validates :password, length: {in: 8..32}, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}

  has_secure_password

  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end
