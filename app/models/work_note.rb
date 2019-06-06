class WorkNote < ApplicationRecord
	belongs_to :note
	belongs_to :work
end
