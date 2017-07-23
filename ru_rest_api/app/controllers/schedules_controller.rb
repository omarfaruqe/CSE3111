class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :update, :destroy]

# GET /schedules
  def index
    @schedules = Schedule.all
    json_response(@schedules)
  end

  # POST /schedules
  def create
    @schedule = Schedule.create!(schedule_params)
    json_response(@schedule, :created)
  end

  # GET /schedules/:id
  def show
    json_response(@schedule)
  end

  # PUT /schedules/:id
  def update
    @schedule.update(schedule_params)
    head :no_content
  end

  # DELETE /schedules/:id
  def destroy
    @schedule.destroy
    head :no_content
  end

  private

  def schedule_params
    # whitelist params
    params.permit(:bus_id, :departure_time, :destination)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
end
