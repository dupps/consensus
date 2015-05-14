RSpec.describe AnswersController do
  describe 'POST create' do
    context 'user is logged in' do
      login_user

      before :each do
        @poll = create(:poll, users: [@user])
      end

      it 'should redirect' do
        post :create, {choice: {id: @poll.choices.first.id}}
        expect(response.status).to eq 302
      end
    end
  end
end