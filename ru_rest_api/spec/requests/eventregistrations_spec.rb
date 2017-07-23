require 'rails_helper'

RSpec.describe "Eventregistrations API", type: :request do
 
    let!(:eventregistrations) { create_list(:eventregistration, 10) }
  let(:eventregistration_id) { eventregistrations.first.id }

  # Test suite for GET /todos
  describe 'GET /eventregistrations' do
    # make HTTP get request before each example
    before { get '/eventregistrations' }

    it 'returns eventregistrations' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /eventregistrations/:id
  describe 'GET /eventregistrations/:id' do
    before { get "/eventregistrations/#{eventregistration_id}" }

    context 'when the record exists' do
      it 'returns the eventregistration' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(eventregistration_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:eventregistration_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Eventregistration/)
      end
    end
  end

  # Test suite for POST /todos
  describe 'POST /eventregistrations' do
    # valid payload
    let(:valid_attributes) { { name: 'Learn Elm', roll: '1' ,department: 'CSE'} }

    context 'when the request is valid' do
      before { post '/eventregistrations', params: valid_attributes }

      it 'creates a eventregistration' do
        expect(json['name']).to eq('Learn Elm')
      end
        #added this line for test
      #it 'creates a eventregistration' do
        #expect(json['roll']).to eq('1')
      #end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/eventregistrations', params: { name: 'Foobar' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      #it 'returns a validation failure message' do
        #expect(response.body)
          #.to match(/Validation failed: Roll can't be blank , Department can't be blank/)
      #end
    end
  end

  # Test suite for PUT /eventregistrations/:id
  describe 'PUT /eventregistrations/:id' do
    let(:valid_attributes) { { name: 'Shopping' } }

    context 'when the record exists' do
      before { put "/eventregistrations/#{eventregistration_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /eventregistrations/:id
  describe 'DELETE /eventregistrations/:id' do
    before { delete "/eventregistrations/#{eventregistration_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
