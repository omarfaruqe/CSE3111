class GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :update, :destroy]

  # GET /guests
  def index
    @guests = Guest.all
    json_response(@guests)
  end

  # POST /guests
  def create
    @guest = Guest.create!(guest_params)
    json_response(@guest, :created)
  end

  # GET /guests/:id
  def show
    json_response(@guest)
  end

  # PUT /guests/:id
  def update
    @guest.update(guest_params)
    head :no_content
  end

  # DELETE /guests/:id
  def destroy
    @guest.destroy
    head :no_content
  end

  private

  def guest_params
    # whitelist params
    params.permit(:name, :status, :arrival)
  end

  def set_guest
    @guest = Guest.find(params[:id])
  end
end