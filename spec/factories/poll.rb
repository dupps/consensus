FactoryGirl.define do
  factory :poll do |p|
    p.topic 'Lunch'
    p.description 'What shall we eat?'
    p.choices { |choices| [choices.association(:choice)] }
    p.active true
    p.expires Time.now+2.hours
    p.created_at Time.now
  end
end