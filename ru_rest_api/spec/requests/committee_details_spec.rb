
require 'rails_helper'

RSpec.describe 'committee_details API', type: :request do
  # initialize test data 
  let!(:committee_details) { create_list(:committee_detail, 10) }
  let(:committee_detail_id) { committee_details.first.id }

  # Test suite for GET /committee_details
  describe 'GET /committee_details' do
    # make HTTP get request before each example
    before { get '/committee_details' }

    it 'returns committee_details' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

##
  # Test suite for GET /committee_details/:id
  #describe 'GET /committee_details/:id' do
   # before { get "/committee_details/#{committee_detail_id}" }

   # context 'when the record exists' do
     # it 'returns the committee_detail' do
      #  expect(json).not_to be_empty
      #  expect(json['id']).to eq(committee_detail_id)
     #end

    #  it 'returns status code 200' do
     #   expect(response).to have_http_status(200)
     # end
    #end

    #context 'when the record does not exist' do
     # let(:committee_detail_id) { 100 }

      #it 'returns status code 404' do
      #  expect(response).to have_http_status(404)
     # end

     # it 'returns a not found message' do
     #   expect(response.body).to match(/Couldn't find committee_detail/)
     #end
    #end
  #end

  ##

  # Test suite for POST /committee_details
  describe 'POST /committee_details' do
    # valid payload
    let(:valid_attributes) { { name: 'Satrolig', president: 'sad', secretary: 'ripon' } }

    context 'when the request is valid' do
      before { post '/committee_details', params: valid_attributes }

      it 'creates a committee_details' do
        expect(json['name']).to eq('Satrolig')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/committee_details', params: { name: 'asad' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

     
    end
  end

  # Test suite for PUT /committee_details/:id
 # describe 'PUT /committee_details/:id' do
  #  let(:valid_attributes) { { bus_id: 232 } }

   # context 'when the record exists' do
  #    before { put "/committee_details/#{committee_detail_id}", params: valid_attributes }

   #   it 'updates the record' do
   #     expect(response.body).to be_empty
   #   end

    #  it 'returns status code 204' do
    #    expect(response).to have_http_status(204)
    #  end
   # end
 # end

  # Test suite for DELETE /committee_details/:id
 # describe 'DELETE /committee_details/:id' do
  #  before { delete "/committee_details/#{committee_detail_id}" }

  #  it 'returns status code 204' do
  #    expect(response).to have_http_status(204)
  #  end
 # end
end