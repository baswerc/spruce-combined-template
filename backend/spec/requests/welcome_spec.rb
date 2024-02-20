# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Welcomes' do
  describe 'GET /' do
    it 'returns success' do
      get '/'
      expect(response).to have_http_status(:success)
    end

    it 'returns welcome message' do
      get '/'
      json = json_response
      expect(json['message']).to include('Welcome')
    end
  end
end
