RSpec.describe Choice do
  it 'is invalid without a title' do
    choice = Choice.new(
        description: 'I need no title...'
    )
    choice.valid?
    expect(choice.errors[:title]).to include("can't be blank")
  end
end
