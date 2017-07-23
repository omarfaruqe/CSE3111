require 'rails_helper'

RSpec.describe "Ambulances", type: :request do
	# initialize test data 
  let!(:ambulances) { create_list(:ambulance, 10) }
  let(:ambulance_id) { ambulances.first.id }
 

  # Test suite for GET /ambulances
  describe 'GET /ambulances' do
    # make HTTP get request before each example
    before { get '/ambulances' }

    it 'returns todos' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

  end

  # Test suite for GET /ambulances/:id
  describe 'GET /ambulances/:id' do
    before { get "/ambulances/#{ambulance_id}" }

    context 'when the record exists' do
      it 'returns the ambulance' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(ambulance_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:ambulance_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Ambulance/)
      end
    end
  end
# end of Test suit for get

# Test suite for POST /ambulances
  describe 'POST /ambulances' do
    # valid payload
    let(:valid_attributes) { { route: 'Rajshahi-Dhaka', availability: 'available', contact_number: '01700000000' } }

    context 'when the request is valid' do
      before { post '/ambulances', params: valid_attributes }

      it 'creates a ambulance' do
        expect(json['route']).to eq('Rajshahi-Dhaka')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/ambulances', params: { route: 'Foobar', contact_number: '01700000000' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match("{\"availability\":[\"can't be blank\"]}")
      end   
    end
  end

  # Test suite for PUT /ambulances/:id
  describe 'PUT /ambulances/:id' do
    let(:valid_attributes) { { route: 'Rajshahi-Bogra' } }

    context 'when the record exists' do
      before { put "/ambulances/#{ambulance_id}", params: valid_attributes }

      it 'returns status code 204' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for DELETE /ambulances/:id
  describe 'DELETE /ambulances/:id' do
    before { delete "/ambulances/#{ambulance_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end
