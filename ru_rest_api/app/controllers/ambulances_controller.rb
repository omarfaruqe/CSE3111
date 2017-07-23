class AmbulancesController < ApplicationController
  before_action :set_ambulance, only: [:show, :update, :destroy]

  # GET /ambulances
  def index
    @ambulances = Ambulance.all

    render json: @ambulances
  end

  # GET /ambulances/1
  def show
    render json: @ambulance
  end

  # POST /ambulances
  def create
    @ambulance = Ambulance.new(ambulance_params)

    if @ambulance.save
      render json: @ambulance, status: :created, location: @ambulance
    else
      render json: @ambulance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ambulances/1
  def update
    if @ambulance.update(ambulance_params)
      render json: @ambulance
    else
      render json: @ambulance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ambulances/1
  def destroy
    @ambulance.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ambulance
      @ambulance = Ambulance.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ambulance_params
      params.permit(:route, :availability, :contact_number)
    end
end
