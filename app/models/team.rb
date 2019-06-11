class Team < ApplicationRecord
	has_many :tags, dependent: :destroy
	has_many :user_teams
	has_many :chats
	has_many :articles

	accepts_nested_attributes_for :tags, allow_destroy: true
	accepts_nested_attributes_for :user_teams

    attachment :team_image

end
