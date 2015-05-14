FactoryGirl.define do
  factory :user do |u|
    u.sequence(:email) { |n| "user#{n}@example.com" }
    u.password 'sicherheit'
    u.password_confirmation 'sicherheit'
  end
end