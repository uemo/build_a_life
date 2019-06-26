class Work < ApplicationRecord
	has_many :notes

	validates :status_k, :status_g, :status_m, :status_c, :status_s, :exp, numericality: {only_integer: true}, length: { in: 1..5 }
    validates :work_title, presence: true, length:{maximum: 20}

	attachment :work_image
end
