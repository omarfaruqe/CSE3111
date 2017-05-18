class DiagonisesController < ApplicationController
  before_action :set_diagonise, only: [:show, :update, :destroy]

  # GET /diagonises
  def index
    @diagonises = Diagonisis.all

    render json: @diagonises
  end

  # GET /diagonises/1
  def show
    render json: @diagonise
  end

  # POST /diagonises
  def create
    @diagonise = Diagonisis.new(diagonise_params)

    if @diagonise.save
      render json: @diagonise, status: :created, location: @diagonise
    else
      render json: @diagonise.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /diagonises/1
  def update
    if @diagonise.update(diagonise_params)
      render json: @diagonise
    else
      render json: @diagonise.errors, status: :unprocessable_entity
    end
  end

  # DELETE /diagonises/1
  def destroy
    @diagonise.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diagonise
      @diagonise = Diagonisis.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def diagonise_params
      params.permit(:name, :fee, :delivery_time)
    end
end
