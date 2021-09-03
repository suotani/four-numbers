FactoryBot.define do
  factory :user, class: User do
    sequence(:username){|i| "username#{i}"}
    sequence(:email){|i| "sample#{i}@example.com"}
    sequence(:password){|i| "password"}
    sequence(:password_confirmation){|i| "password"}
  end
end