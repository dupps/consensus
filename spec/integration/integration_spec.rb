feature 'AddNewPolls', :type => :feature do
  it 'should require the user log in before adding a post' do
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