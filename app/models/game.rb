class Game < ApplicationRecord
  has_many :answers
  belongs_to :user
  has_many :users, through: :answers
end
