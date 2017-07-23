require 'rails_helper'

RSpec.describe "Members", type: :request do
  # initialize test data 
  let!(:members) { create_list(:member, 10) }
  let(:member_id) { members.first.id }

  # Test suite for GET /members
  describe 'GET /members' do
    # make HTTP get request before each memberple
    before { get '/members' }

    it 'returns members' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /members/:id
  describe 'GET /members/:id' do
    before { get "/members/#{member_id}" }

    context 'when the record exists' do
      it 'returns the member' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(member_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:member_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Member/)
      end
    end
  end

  # Test suite for POST /members
  describe 'POST /members' do
    # valid payload
    let(:valid_attributes) { { name: 'Md. Sadiqul Amin', stdId: '1510876117', contactInfo: 'sadiq.cseru@gmail.com', memberStatus: 'President'} }

    context 'when the request is valid' do
      before { post '/members', params: valid_attributes }

      it 'creates a member' do
        expect(json['name']).to eq('Md. Sadiqul Amin')
        expect(json['stdId']).to eq('1510876117')
        expect(json['contactInfo']).to eq('sadiq.cseru@gmail.com')
        expect(json['memberStatus']).to eq('President')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/members', params: { name: 'Md. Sadiqul Amin', stdId: '1510876117', contactInfo: 'sadiq.cseru@gmail.com'} }

      #, memberStatus: 'President', created_at: '2017-07-23T07:54:00.958Z', updated_at: '2017-07-23T07:54:00.958Z'
      #+"{\"id\":11,\"name\":\"Md. Sadiqul Amin\",\"stdId\":\"1510876117\",
      #\"contactInfo\":\"sadiq.cseru@gmail.com\",\"memberStatus\":\"Normal\",
      #\"created_at\":\"2017-07-23T07:54:00.958Z\",
      #\"updated_at\":\"2017-07-23T07:54:00.958Z\"}"

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Validation failed: Created by can't be blank/)
      end
    end
  end

  # Test suite for PUT /members/:id
  describe 'PUT /members/:id' do
    let(:valid_attributes) { { name: 'Shah Mohammad Imran Hossain' } }

    context 'when the record exists' do
      before { put "/members/#{member_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /members/:id
  describe 'DELETE /members/:id' do
    before { delete "/members/#{member_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end