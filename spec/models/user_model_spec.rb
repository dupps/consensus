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
end
