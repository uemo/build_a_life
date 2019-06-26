class Tag < ApplicationRecord
	belongs_to :team

	validates :tag_name, presence: true, length: {maximum: 50}
end
