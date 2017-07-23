# spec/requests/certificates_spec.rb
require 'rails_helper'

RSpec.describe 'Certificates API', type: :request do
  # initialize test data 
  let!(:certificates) { create_list(:certificate, 10) }
  let!(:certificates_id) { certificates.first.id}

  # Test suite for GET /certificates
  describe 'GET /certificates' do
    # make HTTP get request before each example
    before { get '/certificates' }

    it "works! (now write some real spec)" do
      get certificates_path
      expect(response).to have_http_status(200)
    end

   
    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  

  # Test suite for POST /certificates
  describe 'POST /certificates' do
    # valid payload
    let(:valid_attributes) { { name: 'Learn Elm', shift: 'morning', duration: 'two', requirement: 'Bsc' ,created_by: '1' } }

    context 'when the request is valid' do
      before { post '/certificates', params: valid_attributes }

      #it 'creates a certificate' do
       # expect(json['name']).to eq('Learn Elm')
      #end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/certificates', params: { name: 'Foobar', shift: 'Morning', duration: 'Two'} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      #it 'returns a validation failure message' do
        #expect(response.body)
          #.to match(/Validation failed: Created by can't be blank/)
      #end
    end
  end

  

 
end