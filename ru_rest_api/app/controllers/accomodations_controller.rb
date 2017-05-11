class AccomodationsController < ApplicationController
  before_action :set_accomodation, only: [:show, :update, :destroy]

  # GET /accomodations
  def index
    @accomodations = Accomodation.all

    render json: @accomodations
  end

  # GET /accomodations/1
  def show
    render json: @accomodation
  end

  # POST /accomodations
  def create
    @accomodation = Accomodation.new(accomodation_params)

    if @accomodation.save
      render json: @accomodation, status: :created, location: @accomodation
    else
      render json: @accomodation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accomodations/1
  def update
    if @accomodation.update(accomodation_params)
      render json: @accomodation
    else
      render json: @accomodation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /accomodations/1
  def destroy
    @accomodation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accomodation
      @accomodation = Accomodation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def accomodation_params
      params.require(:accomodation).permit(:categories)
    end
end
