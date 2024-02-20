# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'V1::Apidocs' do
  describe 'GET /index' do
      it 'returns success' do
        get '/v1/apidocs'
        expect(response).to have_http_status(:success)
      end
  end
end
