class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :games
  has_many :answers
  has_many :played_games,  through: :answers 

  validates :username, presence: true, uniqueness: true, length: { maximum: 20 }
end
