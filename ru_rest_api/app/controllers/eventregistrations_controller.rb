class EventregistrationsController < ApplicationController
  before_action :set_eventregistration, only: [:show, :update, :destroy]

  def index
    @eventregistrations = Eventregistration.all
    json_response(@eventregistrations)
  end

  # POST /todos
  def create
    @eventregistration = Eventregistration.create!(eventregistration_params)
    json_response(@eventregistration, :created)
  end

  # GET /todos/:id
  def show
    json_response(@eventregistration)
  end

  # PUT /todos/:id
  def update
    @eventregistration.update(eventregistration_params)
    head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @eventregistration.destroy
    head :no_content
  end

  private

  def eventregistration_params
    # whitelist params
    params.permit(:name, :roll ,:department)
  end

  def set_eventregistration
    @eventregistration = Eventregistration.find(params[:id])
  end
end