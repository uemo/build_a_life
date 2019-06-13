class Work < ApplicationRecord
	has_many :work_notes

	attachment :work_image
end
