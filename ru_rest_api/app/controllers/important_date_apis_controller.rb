class ImportantDateApisController < ApplicationController
  before_action :set_important_date_api, only: [:show, :update, :destroy]

  # GET /important_date_apis
  def index
    @important_date_apis = ImportantDateApi.all

    render json: @important_date_apis
  end

  # GET /important_date_apis/1
  def show
    render json: @important_date_api
  end

  # POST /important_date_apis
  def create
    @important_date_api = ImportantDateApi.new(important_date_api_params)

    if @important_date_api.save
      render json: @important_date_api, status: :created, location: @important_date_api
    else
      render json: @important_date_api.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /important_date_apis/1
  def update
    if @important_date_api.update(important_date_api_params)
      render json: @important_date_api
    else
      render json: @important_date_api.errors, status: :unprocessable_entity
    end
  end

  # DELETE /important_date_apis/1
  def destroy
    @important_date_api.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_important_date_api
      @important_date_api = ImportantDateApi.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def important_date_api_params
      params.require(:important_date_api).permit(:Description)
    end
end
