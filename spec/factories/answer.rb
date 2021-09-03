FactoryBot.define do
  factory :answer, class: Answer do
    sequence(:user_id){|i| i }
    sequence(:game_id){|i| i }
  end
end