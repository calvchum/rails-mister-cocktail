class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  # cocktail doesn't have the ID of ingredients, so it has to go through doses
  has_many :ingredients, through: :doses
  validates :name, uniqueness: true, presence: true
  mount_uploader :photo, PhotoUploader

end
