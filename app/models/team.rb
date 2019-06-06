class Team < ApplicationRecord
	has_many :team_tags
	has_many :chats
	has_many :articles
	belongs_to :user
end
