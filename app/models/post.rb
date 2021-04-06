class Post < ApplicationRecord
  belongs_to :genre
  belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :post_comments, dependent: :destroy
	has_many :recipes, dependent: :destroy

	attachment :image

	validates :title, presence: true
	validates :image, presence: true
	validates :introduction, presence: true
	validates :material, presence: true

 def favorited_by?(user)
   favorites.where(user_id: user.id).exists?
 end
end
