class Technology < ApplicationRecord
  belongs_to :portfolio

  validates :name, presence: true
end
