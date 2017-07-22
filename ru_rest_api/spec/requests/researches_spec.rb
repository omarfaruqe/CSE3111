require 'rails_helper'
require 'json'

RSpec.describe "Researches", type: :request do
  describe "GET /researches" do
    it "works! (now write some real specs)" do
      get researches_path
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "POST/researches" do
      let(:valid_attributes){ {name: 'Raihan',topic:'Light'} }

      context "when request is valid" do
          before{ post '/researches',params: valid_attributes }
          it "create a research" do
               expect(json['name']).to eq('Raihan')
          end
          it "returns status code 201" do
              expect(response).to have_http_status(201)
          end
      end

      context "when the request is invalid" do
            before{post '/researches', params: {name:'mahfuz'} }

            it "returns status code 422" do
                expect(response).to have_http_status(422)
            end

      end

  end
end
