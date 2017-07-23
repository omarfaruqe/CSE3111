class ResidencesController < ApplicationController
  before_action :set_residence, only: [:show, :update, :destroy]

  # GET /residences
  def index
    @residences = Residence.all

    render json: @residences
  end

  # GET /residences/1
  def show
    render json: @residence
  end

  # POST /residences
  def create
    @residence = Residence.new(residence_params)

    if @residence.save
      render json: @residence, status: :created, location: @residence
    else
      render json: @residence.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /residences/1
  def update
    if @residence.update(residence_params)
      render json: @residence
    else
      render json: @residence.errors, status: :unprocessable_entity
    end
  end

  # DELETE /residences/1
  def destroy
    @residence.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_residence
      @residence = Residence.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def residence_params
      params.permit(:Dormitory_name, :Total_seat, :Notice)
    end
end
