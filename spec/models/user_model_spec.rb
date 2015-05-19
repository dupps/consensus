RSpec.describe User do
  it 'is invalid with a duplicate email address' do
    User.create(
        email: 'tester@example.com',
        password: 'security',
        password_confirmation: 'security'
    )
    user = User.new(
        email: 'tester@example.com',
        password: 'security',
        password_confirmation: 'security'
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it 'is invalid without any email adress' do
    user = User.new(
         password: 'security',
         password_confirmation: 'security'
    )
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'should return false with new user and poll' do
    user = FactoryGirl.build(:user)
    poll = FactoryGirl.build(:poll)
    expect(user.answered_for?(poll)).to be false
  end
end
