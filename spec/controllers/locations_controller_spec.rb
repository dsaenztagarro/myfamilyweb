require 'rails_helper'

describe LocationsController do
  describe 'GET #index' do
    context 'when user is logged in' do
      login_user

      it 'populates an array of battery sizes' do
        location = build(:location)
        allow(Location).to receive(:all).and_return([location])
        get :index
        expect(assigns(:locations)).to eq([location])
      end

      it 'renders the :index view' do
        get :index
        expect(response).to render_template('index')
      end

      it 'returns a 200 OK status' do
        get :index
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #show' do
    context 'when user is logged in' do
      login_user

      before(:each) do
        @location = create(:location)
        allow(Location).to receive(:find).and_return(@location)
        get :show, id: @location
      end

      it 'assigns the requested battery size to @location' do
        expect(assigns(:location)).to eq(@location)
      end

      it 'renders the #show view' do
        expect(response).to render_template :show
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        get :show, id: create(:location)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #new' do
    context 'when user is logged in' do
      login_user

      it 'assigns @location a new instance' do
        get :new
        expect(assigns(:location)).to be_a_new(Location)
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    context 'when user is logged in' do
      login_user

      before(:each) do
        post :create, location: build(:location).attributes
      end

      it 'redirects to battery size show page' do
        expect(response).to redirect_to(location_path(Location.last))
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        post :create, location: build(:location).attributes
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @location = create(:location, name: 'AA')
    end

    context 'when user is logged in' do
      login_user

      context 'valid attributes' do
        it 'located the requested @location' do
          put :update, id: @location, location: attributes_for(:location)
          expect(assigns(:location)).to eq(@location)
        end

        it "changes @location's attributes" do
          put :update, id: @location,
                       location: attributes_for(:location, name: 'AAA')
          @location.reload
          expect(@location.name).to eq('AAA')
        end

        it 'redirects to the updated location' do
          put :update, id: @location,
                       location: attributes_for(:location)
          expect(response).to redirect_to @location
        end
      end

      context 'invalid attributes' do
        before :each do
          put :update, id: @location,
                       location: attributes_for(:invalid_location)
        end
        it 'locates the requested @location' do
          expect(assigns(:location)).to eq(@location)
        end

        it "does not change @location's attributes" do
          @location.reload
          expect(@location.name).to eq('AA')
        end

        it 're-renders the edit method' do
          expect(response).to render_template :edit
        end
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        put :update, id: @location,
                     location: attributes_for(:location)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @location = create(:location)
    end

    context 'when user is logged in' do
      login_user

      it 'deletes the location' do
        expect do
          delete :destroy, id: @location
        end.to change(Location, :count).by(-1)
      end

      it 'redirects to locations#index' do
        delete :destroy, id: @location
        expect(response).to redirect_to locations_url
      end
    end
  end
end
