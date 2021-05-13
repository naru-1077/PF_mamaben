class Post < ApplicationRecord
  belongs_to :genre
  belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :post_comments, dependent: :destroy

	has_many :recipes, dependent: :destroy
	accepts_nested_attributes_for :recipes, allow_destroy: true

	# has_one :recipe, dependent: :destroy
	# accepts_nested_attributes_for :recipe

    accepts_attachments_for :recipes, attachment: :recipe_image
	attachment :image

	acts_as_taggable

	validates :title, presence: true
	validates :image, presence: true
	validates :introduction, presence: true
	validates :material, presence: true
	validate :score_is_invalid

 def favorited_by?(user)
   favorites.where(user_id: user.id).exists?
 end

 def score_is_invalid
 	if self.score  < 0
 		errors.add(:score, 'こちらの投稿には不適切な文言が含まれているため投稿できません。投稿内容をご確認ください。')
 	end
 end

end
