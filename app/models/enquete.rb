class Enquete < ApplicationRecord
  enum :status, %i[draft published closed].freeze
end
