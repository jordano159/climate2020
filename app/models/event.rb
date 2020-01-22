class Event < ApplicationRecord
  has_many :options
  has_and_belongs_to_many :countries, join_table: "countries_events"
  validates :title,          presence: true
  validates :description,    presence: true
  validates :min_deg,        numericality: { greater_than_or_equal_to: 1.0 }
end
