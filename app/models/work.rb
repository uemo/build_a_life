class Work < ApplicationRecord
	has_many :notes

	attachment :work_image
end
