require 'rails_helper'

RSpec.describe 'Residences API', type: :request do
	 # initialize test data 
let!(:residences) {create_list(:residence, 10) }
let(:residence_id) { residences.first.id }

 # Test suite for GET /vcs
  describe 'GET /residences' do
    # make HTTP get request before each example
    before { get '/residences' }

  it 'returns residences' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end   

  it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end   


# Test suite for POST /residences
  describe 'POST /residences' do
    # valid payload
    let(:valid_attributes) { { Dormitory_name: 'Learn Elm', Total_seat: 30, Notice: 'Mill on' } }  

  context 'when the request is valid' do
      before { post '/residences', params: valid_attributes }

      it 'creates a residence' do
        expect(json['Dormitory_name']).to eq('Learn Elm')
      end

  it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end  
    
  context 'when the request is invalid' do
      before { post '/residences', params: { Dormitory_name: 'Foobar' } }     

   it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end    
      

   end
 end 

  # Test suite for PUT /vcs/:id
 # describe 'PUT /vcs/:id' do
  # let(:valid_attributes) { { name: 'Shopping' } }

  # context 'when the record exists' do
   #   before { put "/vcs/#{vc_id}", params: valid_attributes }

     #it 'updates the record' do
      #  expect(response.body).to be_empty
     # end

    # it 'returns status code 204' do
      #  expect(response).to have_http_status(204)
   #   end
   # end
 # end

  # Test suite for DELETE /vcs/:id
   describe 'DELETE /residences/:id' do
    before { delete "/residences/#{residence_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end