require 'rails_helper'

RSpec.describe "Guests", type: :request do
  # initialize test data 
  let!(:guests) { create_list(:guest, 10) }
  let(:guest_id) { guests.first.id }

  # Test suite for GET /guests
  describe 'GET /guests' do
    # make HTTP get request before each example
    before { get '/guests' }

    it 'returns guests' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /guests/:id
  describe 'GET /guests/:id' do
    before { get "/guests/#{guest_id}" }

    context 'when the record exists' do
      it 'returns the guest' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(guest_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:guest_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      #it 'returns a not found message' do
        #expect(response.body).to match(/Couldn't find Todo/)
      #end
    end
  end

  # Test suite for POST /guests
  describe 'POST /guests' do
    # valid payload
    let(:valid_attributes) { { name: 'Purba', status: 'Chief Guest', arrival: '5:00 pm' } }

    context 'when the request is valid' do
      before { post '/guests', params: valid_attributes }

      it 'creates a guest' do
        expect(json['name']).to eq('Purba')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/guests', params: { name: 'Medha', status: 'Special Guest' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      #it 'returns a validation failure message' do
        #expect(response.body)
          #.to match(/Validation failed: arrival can't be blank/)
      #end
    end
  end

  # Test suite for PUT /guests/:id
  describe 'PUT /guests/:id' do
    let(:valid_attributes) { { name: 'Halima' } }

    context 'when the record exists' do
      before { put "/guests/#{guest_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /guests/:id
  describe 'DELETE /guests/:id' do
    before { delete "/guests/#{guest_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
