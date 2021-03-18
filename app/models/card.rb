class Card < ApplicationRecord
  validates :name, :summary, :full_meaning, :upright, :reversed, :image, :card_index, presence: true
  has_many :card_readings
  has_many :readings, through: :card_readings
end
