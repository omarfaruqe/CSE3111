require 'rails_helper'

RSpec.describe 'Halls API', type: :request do
  # initialize test data 
  let!(:halls) { create_list(:hall, 10) }
  let(:hall_id) { halls.first.id }

  # Test suite for GET /halls
  describe 'GET /halls' do
    # make HTTP get request before each example
    before { get '/halls' }

    it 'returns halls' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /halls/:id
 # describe 'GET /halls/:id' do
  #  before { get "/halls/#{hall_id}" }

  #  context 'when the record exists' do
   #   it 'returns the hall' do
   #     expect(json).not_to be_empty
   #     expect(json['id']).to eq(hall_id)
   #  end

    #  it 'returns status code 200' do
    #    expect(response).to have_http_status(200)
    #  end
    #end

   # context 'when the record does not exist' do
    #  let(:hall_id) { 100 }

    #  it 'returns status code 404' do
    #    expect(response).to have_http_status(404)
    #  end

    #  it 'returns a not found message' do
    #    expect(response.body).to match(/Couldn't find hall/)
    #  end
   # end
 # end

  # Test suite for POST /halls
  describe 'POST /halls' do
    # valid payload
    let(:valid_attributes) { { Hall_Id: 100, Hall_Name: 'Mother Bux', Provost_Name: 'Ashraful', Capacity: 450 } }

    context 'when the request is valid' do
      before { post '/halls', params: valid_attributes }

      it 'creates a hall' do
        expect(json['Hall_Id']).to eq(100)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/halls', params: { Hall_Id: 122 } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

     
    end
  end

  # Test suite for PUT /halls/:id
 # describe 'PUT /halls/:id' do
  #  let(:valid_attributes) { { Hall_Id: 393 } }

   # context 'when the record exists' do
  #    before { put "/halls/#{hall_id}", params: valid_attributes }

   #   it 'updates the record' do
   #     expect(response.body).to be_empty
   #   end

    #  it 'returns status code 204' do
    #    expect(response).to have_http_status(204)
    #  end
   # end
 # end

  # Test suite for DELETE /halls/:id
 # describe 'DELETE /halls/:id' do
  #  before { delete "/halls/#{hall_id}" }

  #  it 'returns status code 204' do
  #    expect(response).to have_http_status(204)
  #  end
 # end
end