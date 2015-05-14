FactoryGirl.define do
  factory :poll do |p|
    p.topic 'Lunch'
    p.description 'What shall we eat?'
    p.choices { |choices| [choices.association(:choice)] }
  end
end