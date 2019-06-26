class Team < ApplicationRecord
	has_many :tags, dependent: :destroy
	has_many :user_teams, dependent: :destroy
	has_many :chats, dependent: :destroy
	has_many :articles, dependent: :destroy
	has_many :users, through: :user_teams

	validates :team_name, presence: true, length:{maximum: 20}
    validates :team_body, presence: true, length:{maximum: 500}

	accepts_nested_attributes_for :tags, allow_destroy: true
	accepts_nested_attributes_for :user_teams

    attachment :team_image

end
