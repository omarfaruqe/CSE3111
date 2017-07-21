require 'rails_helper'

RSpec.describe 'Doctors API', type: :request do
  # initialize test data 
  let!(:doctors) { create_list(:doctor, 10) }
  let(:doctor_id) { doctors.first.id }

  # Test suite for GET /vcs
  describe 'GET /doctors' do
    # make HTTP get request before each example
    before { get '/doctors' }

    it 'returns doctors' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /vcs/:id
 # describe 'GET /vcs/:id' do
  #  before { get "/vcs/#{vc_id}" }

  #  context 'when the record exists' do
   #   it 'returns the vc' do
   #     expect(json).not_to be_empty
   #     expect(json['id']).to eq(vc_id)
   #  end

    #  it 'returns status code 200' do
    #    expect(response).to have_http_status(200)
    #  end
    #end

   # context 'when the record does not exist' do
    #  let(:vc_id) { 100 }

    #  it 'returns status code 404' do
    #    expect(response).to have_http_status(404)
    #  end

    #  it 'returns a not found message' do
    #    expect(response.body).to match(/Couldn't find Vc/)
    #  end
   # end
 # end

  # Test suite for POST /vcs
  describe 'POST /doctors' do
    # valid payload
    let(:valid_attributes) { { name: 'ripon', fee: '500', visit_time: '10.00-12.00' } }

    context 'when the request is valid' do
      before { post '/doctors', params: valid_attributes }

      it 'creates a doctor' do
        expect(json['name']).to eq('ripon')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/doctors', params: { name: 'ripon' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

     
    end
  end

  # Test suite for PUT /vcs/:id
 # describe 'PUT /vcs/:id' do
  #  let(:valid_attributes) { { name: 'Shopping' } }

   # context 'when the record exists' do
  #    before { put "/vcs/#{vc_id}", params: valid_attributes }

   #   it 'updates the record' do
   #     expect(response.body).to be_empty
   #   end

    #  it 'returns status code 204' do
    #    expect(response).to have_http_status(204)
    #  end
   # end
 # end

  # Test suite for DELETE /vcs/:id
 # describe 'DELETE /vcs/:id' do
  #  before { delete "/vcs/#{vc_id}" }

  #  it 'returns status code 204' do
  #    expect(response).to have_http_status(204)
  #  end
 # end
end