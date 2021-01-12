FactoryBot.define do
  factory :game, class: Game do
    sequence(:limit){|i| i }
    sequence(:number){|i| (0..3).to_a.join}
    sequence(:bet){|i| i * 10}
    sequence(:user_id){|i| i }
  end
end