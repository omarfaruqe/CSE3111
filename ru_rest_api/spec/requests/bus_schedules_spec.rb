
require 'rails_helper'

RSpec.describe 'Bus_Schedule API', type: :request do
  # initialize test data 
  let!(:bus_schedules) { create_list(:bus_schedule, 10) }
  let(:bus_schedule_id) { bus_schedules.first.id }

  # Test suite for GET /bus_schedules
  describe 'GET /bus_schedules' do
    # make HTTP get request before each example
    before { get '/bus_schedules' }

    it 'returns bus_schedules' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

##
  # Test suite for GET /bus_schedules/:id
  #describe 'GET /bus_schedules/:id' do
   # before { get "/bus_schedules/#{bus_schedule_id}" }

   # context 'when the record exists' do
     # it 'returns the bus_schedule' do
      #  expect(json).not_to be_empty
      #  expect(json['id']).to eq(bus_schedule_id)
     #end

    #  it 'returns status code 200' do
     #   expect(response).to have_http_status(200)
     # end
    #end

    #context 'when the record does not exist' do
     # let(:bus_schedule_id) { 100 }

      #it 'returns status code 404' do
      #  expect(response).to have_http_status(404)
     # end

     # it 'returns a not found message' do
     #   expect(response.body).to match(/Couldn't find bus_schedule/)
     #end
    #end
  #end

  ##

  # Test suite for POST /bus_schedules
  describe 'POST /bus_schedules' do
    # valid payload
    let(:valid_attributes) { { bus_id: 102, time: '10:20', starting_place: 'campus', destination:'Barnali', bus_type: 'male' } }

    context 'when the request is valid' do
      before { post '/bus_schedules', params: valid_attributes }

      it 'creates a bus_schedules' do
        expect(json['bus_id']).to eq(102)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/bus_schedules', params: { bus_id: 221 } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

     
    end
  end

  # Test suite for PUT /bus_schedules/:id
 # describe 'PUT /bus_schedules/:id' do
  #  let(:valid_attributes) { { bus_id: 232 } }

   # context 'when the record exists' do
  #    before { put "/bus_schedules/#{bus_schedule_id}", params: valid_attributes }

   #   it 'updates the record' do
   #     expect(response.body).to be_empty
   #   end

    #  it 'returns status code 204' do
    #    expect(response).to have_http_status(204)
    #  end
   # end
 # end

  # Test suite for DELETE /bus_schedules/:id
 # describe 'DELETE /bus_schedules/:id' do
  #  before { delete "/bus_schedules/#{bus_schedule_id}" }

  #  it 'returns status code 204' do
  #    expect(response).to have_http_status(204)
  #  end
 # end
end