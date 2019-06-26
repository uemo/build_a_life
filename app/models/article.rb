class Article < ApplicationRecord
	belongs_to :team
	belongs_to :user

    validates :article_title, presence: true, length: {minium:1, maximum: 50}
	validates :article_body, presence: true, length: {maximum: 3000}
end
