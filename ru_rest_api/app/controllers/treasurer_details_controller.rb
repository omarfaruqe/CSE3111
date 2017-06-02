class TreasurerDetailsController < ApplicationController
  before_action :set_treasurer_detail, only: [:show, :update, :destroy]

  # GET /treasurer_details
  def index
    @treasurer_details = TreasurerDetail.all

    render json: @treasurer_details
  end

  # GET /treasurer_details/1
  def show
    render json: @treasurer_detail
  end

  # POST /treasurer_details
  def create
    @treasurer_detail = TreasurerDetail.new(treasurer_detail_params)

    if @treasurer_detail.save
      render json: @treasurer_detail, status: :created, location: @treasurer_detail
    else
      render json: @treasurer_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /treasurer_details/1
  def update
    if @treasurer_detail.update(treasurer_detail_params)
      render json: @treasurer_detail
    else
      render json: @treasurer_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /treasurer_details/1
  def destroy
    @treasurer_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_treasurer_detail
      @treasurer_detail = TreasurerDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def treasurer_detail_params
      params.require(:treasurer_detail).permit(:name, :about, :extreasurers)
    end
end
