class IctCentersController < ApplicationController
  before_action :set_ict_center, only: [:show, :update, :destroy]

  # GET /ict_centers
  def index
    @ict_centers = IctCenter.all

    render json: @ict_centers
  end

  # GET /ict_centers/1
  def show
    render json: @ict_center
  end

  # POST /ict_centers
  def create
    @ict_center = IctCenter.new(ict_center_params)

    if @ict_center.save
      render json: @ict_center, status: :created, location: @ict_center
    else
      render json: @ict_center.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ict_centers/1
  def update
    if @ict_center.update(ict_center_params)
      render json: @ict_center
    else
      render json: @ict_center.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ict_centers/1
  def destroy
    @ict_center.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ict_center
      @ict_center = IctCenter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ict_center_params
      params.permit(:adminitrator, :formeradministrator, :advisory_commitee)
    end
end
