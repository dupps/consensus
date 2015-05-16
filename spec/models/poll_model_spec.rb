RSpec.describe Poll do
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
