require 'rails_helper'

RSpec.describe 'Registrars API', type: :request do
  # initialize test data 

  let!(:registrars) { create_list(:registrar, 10) }
  let(:registrar_id) { registrars.first.id }

  # Test suite for GET /registrars
  describe 'GET /registrars' do
    # make HTTP get request before each example
    before { get '/registrars' }

    it 'returns registrars' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /registrars/:id
  describe 'GET /registrars/:id' do
    before { get "/registrars/#{registrar_id}" }

    context 'when the record exists' do
      it 'returns the registrar' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(registrar_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:registrar_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Registrar/)
      end
    end
  end

  # Test suite for POST /registrars
  describe 'POST /registrars' do
    # valid payload
    let(:valid_attributes) { { name: 'Sadiq Nayeem', about: 'He became registrar in 2011' , contact: '019287474737' } }

    context 'when the request is valid' do
      before { post '/registrars', params: valid_attributes }

      it 'creates a registrar' do
        expect(json['name']).to eq('Sadiq Nayeem')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/registrars', params: { name: 'Soad' , about: 'He became registrar in 2007' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Contact can't be blank/)
      end
    end
  end

  # Test suite for PUT /registrars/:id
  describe 'PUT /registrars/:id' do
    let(:valid_attributes) { { name: 'Munir' } }

    context 'when the record exists' do
      before { put "/registrars/#{registrar_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /registrars/:id
  describe 'DELETE /registrars/:id' do
    before { delete "/registrars/#{registrar_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end