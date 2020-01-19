class Minister < ApplicationRecord
  validates :role,          presence: true
  validates :description,    presence: true
end
