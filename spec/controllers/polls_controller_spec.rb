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

  describe 'GET show' do
    context 'user is logged in' do
      login_user

      before :each do
        @poll = create(:poll, users: [@user])
      end

      it 'responds with 200' do
        get :show, { id: @poll.id }
        expect(response.status).to eq 200
      end

      it 'renders the index template' do
        get :show, { id: @poll.id }
        expect(response).to render_template 'show'
      end
    end
  end

  describe 'GET edit' do
    context 'user is logged in' do
      login_user

      before :each do
        @poll = create(:poll, users: [@user])
      end

      it 'responds with 200' do
        get :edit, { id: @poll.id }
        expect(response.status).to eq 200
      end

      it 'renders the index template' do
        get :edit, { id: @poll.id }
        expect(response).to render_template 'edit'
      end
    end
  end

  describe 'GET new' do
    context 'user is logged in' do
      login_user

      before :each do
        @poll = create(:poll, users: [@user])
      end

      it 'responds with 200' do
        get :new, { id: @poll.id }
        expect(response.status).to eq 200
      end

      it 'renders the index template' do
        get :new, { id: @poll.id }
        expect(response).to render_template 'new'
      end
    end
  end

end