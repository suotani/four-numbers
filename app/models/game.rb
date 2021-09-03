class Game < ApplicationRecord
  has_many :answers
  belongs_to :user
  has_many :users, through: :answers

  validates :title, presence: true, length: {maximum: 20}
  validates :limit, presence: true
  validates :number, presence: true, length: {maximum: 4, minimum: 4}
  validates :bet, presence: true
end

# create_table "games", force: :cascade do |t|
#   t.string "title", default: "無題", null: false
#   t.integer "limit"
#   t.string "number"
#   t.integer "status", default: 1, null: false
#   t.integer "bet", default: 0, null: false
#   t.integer "user_id"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
# end