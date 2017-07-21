#require 'rails_helper'

#RSpec.describe "TeachersQuarters", type: :request do
#  describe "GET /teachers_quarters" do
#    it "works! (now write some real specs)" do
 #     get teachers_quarters_path
 #     expect(response).to have_http_status(200)
 #   end
 # end
#end


require 'rails_helper'

RSpec.describe 'Teachers_Quarter API', type: :request do
  # initialize test data 
  let!(:teachers_quarters) { create_list(:teachers_quarter, 10) }
  let(:teachers_quarter_id) { teachers_quarters.first.id }

  # Test suite for GET /vcs
  describe 'GET /teachers_quarters' do
    # make HTTP get request before each example
    before { get '/teachers_quarters' }

    it 'returns teachers_quarters' do
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
  describe 'POST /teachers_quarters' do
    # valid payload
    let(:valid_attributes) { { name: 'Mother_bux', block: 'C', location: 'west side' } }

    context 'when the request is valid' do
      before { post '/teachers_quarters', params: valid_attributes }

      it 'creates a teachers_quarters' do
        expect(json['name']).to eq('Mother_bux')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/teachers_quarters', params: { name: 'Foobar' } }

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