require 'rails_helper'
require 'json'

RSpec.describe "Researches", type: :request do

  # GET Request..............................................>

  describe "GET /researches" do
    it "works! (now write some real specs)" do
      get researches_path
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  # POST Request...............................................>

  describe "POST/researches" do

      let(:valid_attributes){ {name: 'Raihan',topic:'Light'} }

      context "when request is valid" do

          before{ post '/researches',params:valid_attributes }

          it "returns status code 201" do
              expect(response).to have_http_status(201)
          end


      end

     #let(:valid_attributes){ {name: 'Raihan',topic:nil}}

     context "when request not valid" do

         before{post '/researches',params: {topic:nil} }

         it "returns status code 422" do
           expect(response).to_not have_http_status(201)
         end

     end

      #let(:valid_attributes){ {name: nil,topic:'Light'}}

      context "when request not valid" do

        before{post '/researches',params:{name:nil} }

        it "returns status code 422" do
          expect(response).to_not have_http_status(201)
        end

      end


      #let(:valid_attributes){ {name: nil,topic:nil}}

      context "when request not valid" do

        before{post '/researches',params:{name:nil,topic:nil} }

        it "returns status code 422" do
          expect(response).to_not have_http_status(201)
        end

      end


  end

  # PUT Request....................................................>

  describe "PUT/researches/:id" do


     let(:valid_attributes){ {name:'Mahfuz'} }

     context "when record exists" do

        before{put '/researches/#{research_id}',params:valid_attributes}

        it "updates the record" do
            expect(response.body).to be_empty
        end

        it "returns status code 204" do
            expect(response).to have_http_status(204)
        end


     end




  end


  # DELETE Request......................................>

  describe "DELETE/researches/:id" do

    context "when record exists" do

      before{delete '/researches/#{research_id}'}

      it "returns status code 204" do
        expect(response).to have_http_status(204)
      end


    end

  end

end
