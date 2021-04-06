class Recipe < ApplicationRecord
  belongs_to :post

  attachment :image

	validates :recipe, presence: true
end
