class Comment < ApplicationRecord
	belongs_to :note
	belongs_to :user

	validates :comment_body, presence: true, length: {maximum: 300}
end
