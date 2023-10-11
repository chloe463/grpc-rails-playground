class Enquete < ApplicationRecord
  enum status: { draft: 1, published: 2, closed: 3 }.freeze
end
