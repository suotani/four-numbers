class Tweet < ApplicationRecord

  validates :memo, presence: true
end
