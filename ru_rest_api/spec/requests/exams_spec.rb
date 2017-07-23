# spec/requests/exams_spec.rb
require 'rails_helper'

RSpec.describe 'Exams API', type: :request do
  # initialize test data 
  let!(:exams) { create_list(:exam, 10) }
  let(:exam_id) { exams.first.id }

  # Test suite for GET /exams
  describe 'GET /exams' do
    # make HTTP get request before each example
    before { get '/exams' }

    it 'returns exams' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /exams/:id
  describe 'GET /exams/:id' do
    before { get "/exams/#{exam_id}" }

    context 'when the record exists' do
      it 'returns the exam' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(exam_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:exam_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Exam/)
      end
    end
  end

  # Test suite for POST /exams
  describe 'POST /exams' do
    # valid payload
    let(:valid_attributes) { { exam_id: '2230', time: '22.30pm', date: '4.2.14', length: '4 hrs'} }

    context 'when the request is valid' do
      before { post '/exams', params: valid_attributes }

      it 'creates a exam' do
        expect(json['exam_id']).to eq('2230')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/exams', params: { exam_id: '2323', time: '22.30 pm', date: '2.4.7' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Length can't be blank/)
      end
    end
  end

  # Test suite for PUT /exams/:id
  describe 'PUT /exams/:id' do
    let(:valid_attributes) { { exam_id: '2222' } }

    context 'when the record exists' do
      before { put "/exams/#{exam_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /exams/:id
  describe 'DELETE /exams/:id' do
    before { delete "/exams/#{exam_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end