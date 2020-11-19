class Location < ApplicationRecord
  has_one_attached :cover_image
  validates :name, presence: true
  validates :category, presence: true
  validates :city, presence: true
  validates :state, presence: true
end
