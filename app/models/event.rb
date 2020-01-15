class Event < ApplicationRecord
  validates :title,          presence: true
  validates :description,    presence: true
  validates :min_deg,        numericality: { greater_than_or_equal_to: 1.0 }
end
