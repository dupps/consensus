FactoryGirl.define do
  factory :user do |u|
    u.sequence(:email) { |n| "tester#{n}@example.com" }
    u.password 'security'
    u.password_confirmation 'security'
  end
end