RSpec.describe PollsController do
  describe 'GET index' do
    context 'user is logged in' do
      login_user

      it 'responds with 200' do
        get :index
        expect(response.status).to eq 200
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template 'index'
      end
    end

    context 'unauthorized to access' do
      it 'should redirect' do
        get :index
        expect(response.status).to eq 302
      end
    end
  end

  context 'user is logged in' do
    login_user

    before :each do
      @poll = create(:poll, users: [@user])
    end

    describe 'GET show' do
      it 'responds with 200' do
        get :show, { id: @poll.id }
        expect(response.status).to eq 200
      end

      it 'renders the index template' do
        get :show, { id: @poll.id }
        expect(response).to render_template 'show'
      end

      render_views
      it 'should render the partials' do
        get :show, { id: @poll.id }
        expect(response).to render_template(:partial => '_answer_form')
        expect(response).to render_template(:partial => '_choice')
      end
    end

    describe 'GET edit' do
      it 'responds with 200' do
        get :edit, { id: @poll.id }
        expect(response.status).to eq 200
      end

      it 'renders the index template' do
        get :edit, { id: @poll.id }
        expect(response).to render_template 'edit'
      end
    end

    describe 'GET new' do
      it 'responds with 200' do
        get :new, { id: @poll.id }
        expect(response.status).to eq 200
      end

      it 'renders the index template' do
        get :new, { id: @poll.id }
        expect(response).to render_template 'new'
      end
    end

    describe 'POST create' do
      context 'with valid attributes' do
        it 'creates a new poll' do
          expect{
            post :create, poll: {
                            topic: 'Lunch',
                            description: 'What shall we eat?',
                            choices_attributes: {
                                '12345' => {title: 'Burger', description: 'with fries'}
                            }
                          }
          }.to change(Poll,:count).by(1)
        end

        it 'redirects to the new poll' do
          post :create, poll: {
                          topic: 'Lunch',
                          description: 'What shall we eat?',
                          choices_attributes: {
                              '12345' => {title: 'Burger', description: 'with fries'}
                          }
                        }
          expect(response).to redirect_to Poll.last
        end
      end

      context 'with invalid attributes' do
        it 're-renders the new method' do
          # attributes_for gives no association attributes => invalid poll
          post :create, poll: FactoryGirl.attributes_for(:poll)
          expect(response).to render_template :new
        end
      end
    end

    describe 'PUT/PATCH update' do
      context 'with valid attributes' do
        it 'should update the poll' do
          updated_attributes = { topic: 'new topic', description: 'new description' }
          patch :update, id: @poll.id, poll: updated_attributes
          @poll = Poll.find(@poll.id)
          expect(@poll.topic).to eq(updated_attributes[:topic])
          expect(@poll.description).to eq(updated_attributes[:description])
        end

        it 'redirects to the updated poll' do
          patch :update, id: @poll.id, poll: {topic: 'new topic'}
          expect(response).to redirect_to poll_url
        end
      end

      context 'with invalid attributes' do
        it 're-renders the edit method' do
          patch :update, id: @poll.id, poll: FactoryGirl.attributes_for(:poll, topic: nil)
          expect(response).to render_template :edit
        end
      end
    end

    describe 'DELETE destroy' do
      it 'should delete the poll' do
        delete :destroy, { id: @poll.id }
        expect(Poll.exists?(@poll.id)).to be false
      end
      it 'redirects to the polls overview' do
        delete :destroy, { id: @poll.id }
        expect(response).to redirect_to polls_url
      end
    end

  end
end