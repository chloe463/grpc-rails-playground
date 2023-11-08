class Enquete < ApplicationRecord
  has_many :questions
  has_many :options, through: :questions
  # belongs_to :author, foreign_key: 'author_id', class_name: 'User'
  enum status: { draft: 1, published: 2, closed: 3 }.freeze
end
