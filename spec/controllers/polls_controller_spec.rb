RSpec.describe PollsController do
  describe 'GET index' do
    login_user

    context 'user is logged in' do
      it 'responds with 200' do
        get :index
        expect(response.status).to eq 200
      end
    end
  end
end