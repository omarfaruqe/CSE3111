class IctCentresController < ApplicationController
  before_action :set_ict_centre, only: [:show, :update, :destroy]

  # GET /ict_centres
  def index
    @ict_centres = IctCentre.all

    render json: @ict_centres
  end

  # GET /ict_centres/1
  def show
    render json: @ict_centre
  end

  # POST /ict_centres
  def create
    @ict_centre = IctCentre.new(ict_centre_params)

    if @ict_centre.save
      render json: @ict_centre, status: :created, location: @ict_centre
    else
      render json: @ict_centre.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ict_centres/1
  def update
    if @ict_centre.update(ict_centre_params)
      render json: @ict_centre
    else
      render json: @ict_centre.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ict_centres/1
  def destroy
    @ict_centre.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ict_centre
      @ict_centre = IctCentre.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ict_centre_params
      params.require(:ict_centre).permit(:administrator, :advisor)
    end
end
