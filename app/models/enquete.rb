class Enquete < ApplicationRecord
  has_many :questions
  enum status: { draft: 1, published: 2, closed: 3 }.freeze
end
