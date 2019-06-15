class Note < ApplicationRecord
	belongs_to :user
	belongs_to :works
	has_many :comments
	has_many :favorites, dependent: :destroy

	def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
    end

end
