class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

end
