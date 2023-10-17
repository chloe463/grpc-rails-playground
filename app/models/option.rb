class Option < ApplicationRecord
  belongs_to :question
  delegate :enquete, to: :question
end
