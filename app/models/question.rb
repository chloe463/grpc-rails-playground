class Question < ApplicationRecord
  belongs_to :enquete
  enum format: { radio: 1, checkbox: 2, dropdown: 3, free_text: 4 }.freeze
end
