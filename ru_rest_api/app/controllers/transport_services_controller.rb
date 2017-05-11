class TransportServicesController < ApplicationController
  before_action :set_transport_service, only: [:show, :update, :destroy]

  # GET /transport_services
  def index
    @transport_services = TransportService.all

    render json: @transport_services
  end

  # GET /transport_services/1
  def show
    render json: @transport_service
  end

  # POST /transport_services
  def create
    @transport_service = TransportService.new(transport_service_params)

    if @transport_service.save
      render json: @transport_service, status: :created, location: @transport_service
    else
      render json: @transport_service.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transport_services/1
  def update
    if @transport_service.update(transport_service_params)
      render json: @transport_service
    else
      render json: @transport_service.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transport_services/1
  def destroy
    @transport_service.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transport_service
      @transport_service = TransportService.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transport_service_params
      params.require(:transport_service).permit(:BusSchedule, :BusType, :RouteInfo)
    end
end
