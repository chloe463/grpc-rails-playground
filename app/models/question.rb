class Question < ApplicationRecord
  belongs_to :enquete
  has_many :options
  enum format: { radio: 1, checkbox: 2, dropdown: 3, free_text: 4 }.freeze
end
