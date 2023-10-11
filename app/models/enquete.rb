class Enquete < ApplicationRecord
  has_many :questions
  has_many :options, through: :questions
  enum status: { draft: 1, published: 2, closed: 3 }.freeze
end
