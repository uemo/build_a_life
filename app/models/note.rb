class Note < ApplicationRecord
	belongs_to :user
	has_many :comments
	has_many :favorites
	has_many :work_notes
end
