RSpec.describe Poll do
  it 'is invalid without a topic' do
    poll = Poll.new(
        description: 'what shall we eat?',
        expires: DateTime.now+2.hours,
        active: true,
        created_at: DateTime.now,
        updated_at: DateTime.now,
        choices_attributes: { choice: FactoryGirl.attributes_for(:choice) }
    )
    poll.valid?
    expect(poll.errors[:topic]).to include("can't be blank")
  end

  it 'is invalid without a description' do
    poll = Poll.new(
        topic: 'Lunch',
        expires: DateTime.now+2.hours,
        active: true,
        created_at: DateTime.now,
        updated_at: DateTime.now,
        choices_attributes: { choice: FactoryGirl.attributes_for(:choice) }
    )
    poll.valid?
    expect(poll.errors[:description]).to include("can't be blank")
  end

  it 'is invalid without any choice' do
    poll = Poll.new(
        topic: 'Lunch',
        description: 'what shall we eat?',
        expires: DateTime.now+2.hours,
        active: true,
        created_at: DateTime.now,
        updated_at: DateTime.now
    )
    poll.valid?
    expect(poll.errors[:choices]).to include("can't be blank")
  end
end
