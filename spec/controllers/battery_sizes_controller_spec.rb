require 'rails_helper'

describe BatterySizesController do
  describe 'GET index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
end
