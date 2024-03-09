require 'rails_helper'

RSpec.describe 'Api::V1::WeatherController', type: :request do
  describe 'GET /api/v1/weather' do
    context 'success' do
      it 'returns a successful response' do
        get '/api/v1/weather?city=tokyo'
        expect(JSON.parse(response.body).keys).to eq(%w[coord weather base main visibility wind clouds
                                                        dt sys timezone id name cod])
        expect(response).to have_http_status(200)
      end
    end

    context 'invalid request' do
      it 'returns an error message without city params' do
        get '/api/v1/weather'
        expect(JSON.parse(response.body)).to eq({ 'error' => 'Missing city params' })
        expect(response).to have_http_status(422)
      end
    end
  end
end
