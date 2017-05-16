class AdmissionDetailsController < ApplicationController
  before_action :set_admission_detail, only: [:show, :update, :destroy]

  # GET /admission_details
  def index
    @admission_details = AdmissionDetail.all

    render json: @admission_details
  end

  # GET /admission_details/1
  def show
    render json: @admission_detail
  end

  # POST /admission_details
  def create
    @admission_detail = AdmissionDetail.new(admission_detail_params)

    if @admission_detail.save
      render json: @admission_detail, status: :created, location: @admission_detail
    else
      render json: @admission_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /admission_details/1
  def update
    if @admission_detail.update(admission_detail_params)
      render json: @admission_detail
    else
      render json: @admission_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /admission_details/1
  def destroy
    @admission_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admission_detail
      @admission_detail = AdmissionDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admission_detail_params
      params.require(:admission_detail).permit(:cost, :person_id, :admission_id, :needed_document, :last_admission_date)
    end
end
