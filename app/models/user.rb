class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_teams, dependent: :destroy
  has_many :articles
  has_many :chats
  has_many :logs, dependent: :destroy
  has_many :favorites
  has_many :notes, dependent: :destroy
  has_many :comments

  validates :name, :ruby_name, :hundle_name, length: { in: 1..200 }
  validates :phone, numericality: {only_integer: true}, length: { in: 5..20 }
  validates :address, length:{maximum: 100}
  validates :introduction, length:{maximum: 1000}
  validates :goal, length:{maximum: 200}

  attachment :user_image

end
