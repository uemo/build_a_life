class Note < ApplicationRecord
	belongs_to :user
	belongs_to :work
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	validates :note_body, length:{maximum: 1000}

	def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
    end

end
