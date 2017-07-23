class GeneralInformationsController < ApplicationController
  before_action :set_general_information, only: [:show, :update, :destroy]

  # GET /general_informations
  def index
    @general_informations = GeneralInformation.all

    render json: @general_informations
  end

  # GET /general_informations/1
  def show
    render json: @general_information
  end

  # POST /general_informations
  def create
    @general_information = GeneralInformation.new(general_information_params)

    if @general_information.save
      render json: @general_information, status: :created, location: @general_information
    else
      render json: @general_information.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /general_informations/1
  def update
    if @general_information.update(general_information_params)
      render json: @general_information
    else
      render json: @general_information.errors, status: :unprocessable_entity
    end
  end

  # DELETE /general_informations/1
  def destroy
    @general_information.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_general_information
      @general_information = GeneralInformation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def general_information_params
      params.require(:general_information).permit(:no_of_bus, :budget, :cost, :year)
    end
end
