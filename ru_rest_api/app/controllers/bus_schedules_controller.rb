class BusSchedulesController < ApplicationController
  before_action :set_bus_schedule, only: [:show, :update, :destroy]

  # GET /bus_schedules
  def index
    @bus_schedules = BusSchedule.all

    render json: @bus_schedules
  end

  # GET /bus_schedules/1
  def show
    render json: @bus_schedule
  end

  # POST /bus_schedules
  def create
    @bus_schedule = BusSchedule.new(bus_schedule_params)

    if @bus_schedule.save
      render json: @bus_schedule, status: :created, location: @bus_schedule
    else
      render json: @bus_schedule.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bus_schedules/1
  def update
    if @bus_schedule.update(bus_schedule_params)
      render json: @bus_schedule
    else
      render json: @bus_schedule.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bus_schedules/1
  def destroy
    @bus_schedule.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bus_schedule
      @bus_schedule = BusSchedule.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bus_schedule_params
      params.require(:bus_schedule).permit(:types)
    end
end
