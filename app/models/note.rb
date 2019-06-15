class Note < ApplicationRecord
	belongs_to :user
	belongs_to :works
	has_many :comments
	has_many :favorites

end
