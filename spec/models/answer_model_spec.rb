RSpec.describe Answer do
  it 'is valid if user has not answered' do
    user = FactoryGirl.build(:user)
    choice = FactoryGirl.build(:choice)
    answer = Answer.new(user: user, choice: choice)
    expect(answer).to be_valid
  end
end
