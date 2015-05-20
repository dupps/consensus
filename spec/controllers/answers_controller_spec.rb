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

      it 'should redirect to the specific poll' do
        post :create, {choice: {id: @poll.choices.first.id}}
        expect(response.body).to include(poll_url id: @poll.id)
      end

      it 'should append url parameter to hide notification' do
        post :create, {choice: {id: @poll.choices.first.id}}
        expect(response.body).to include("?hide_already_answered=true")
      end
    end
  end
end