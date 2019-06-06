class TeamTag < ApplicationRecord
	belongs_to :tag
	belongs_to :team
end
