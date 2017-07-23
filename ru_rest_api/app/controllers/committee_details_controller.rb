class CommitteeDetailsController < ApplicationController
  before_action :set_committee_detail, only: [:show, :update, :destroy]

  # GET /committee_details
  def index
    @committee_details = CommitteeDetail.all

    render json: @committee_details
  end

  # GET /committee_details/1
  def show
    render json: @committee_detail
  end

  # POST /committee_details
  def create
    @committee_detail = CommitteeDetail.new(committee_detail_params)

    if @committee_detail.save
      render json: @committee_detail, status: :created, location: @committee_detail
    else
      render json: @committee_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /committee_details/1
  def update
    if @committee_detail.update(committee_detail_params)
      render json: @committee_detail
    else
      render json: @committee_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /committee_details/1
  def destroy
    @committee_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_committee_detail
      @committee_detail = CommitteeDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def committee_detail_params
      params.permit(:name, :president, :secretary)
    end
end
