feature 'AddNewPoll', :type => :feature do
  it 'should require the user log in before adding a poll' do
    user = create(:user)
    visit new_poll_path
    within('#new_user') do
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => user.password
    end
    click_link_or_button 'Log in'
    expect(page).to have_content 'Create a new poll'
  end
end

feature 'UserRegistration', :type => :feature do
  it 'allows a user to regiser' do
    visit new_user_registration_path
    fill_in 'user_email', :with => 'test@example.com'
    fill_in 'user_password', :with => 'security'
    fill_in 'user_password_confirmation', :with => 'security'
    click_button 'Sign up'
    expect(page).to have_content 'Welcome!'
  end
end
