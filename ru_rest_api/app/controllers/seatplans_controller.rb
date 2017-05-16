class SeatplansController < ApplicationController
  before_action :set_seatplan, only: [:show, :update, :destroy]

  # GET /seatplans
  def index
    @seatplans = Seatplan.all

    render json: @seatplans
  end

  # GET /seatplans/1
  def show
    render json: @seatplan
  end

  # POST /seatplans
  def create
    @seatplan = Seatplan.new(seatplan_params)

    if @seatplan.save
      render json: @seatplan, status: :created, location: @seatplan
    else
      render json: @seatplan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /seatplans/1
  def update
    if @seatplan.update(seatplan_params)
      render json: @seatplan
    else
      render json: @seatplan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /seatplans/1
  def destroy
    @seatplan.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seatplan
      @seatplan = Seatplan.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def seatplan_params
      params.require(:seatplan).permit(:building_name, :floor_no, :room_no, :seat_no)
    end
end
