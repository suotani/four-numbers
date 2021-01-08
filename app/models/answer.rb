class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :played_game, class_name: "Game", foreign_key: :game_id
end
