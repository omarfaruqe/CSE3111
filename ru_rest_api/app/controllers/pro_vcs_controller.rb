class ProVcsController < ApplicationController
  before_action :set_pro_vc, only: [:show, :update, :destroy]

  # GET /pro_vcs
  def index
    @pro_vcs = ProVc.all

    render json: @pro_vcs
  end

  # GET /pro_vcs/1
  def show
    render json: @pro_vc
  end

  # POST /pro_vcs
  def create
    @pro_vc = ProVc.new(pro_vc_params)

    if @pro_vc.save
      render json: @pro_vc, status: :created, location: @pro_vc
    else
      render json: @pro_vc.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pro_vcs/1
  def update
    if @pro_vc.update(pro_vc_params)
      render json: @pro_vc
    else
      render json: @pro_vc.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pro_vcs/1
  def destroy
    @pro_vc.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pro_vc
      @pro_vc = ProVc.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pro_vc_params
      params.permit(:name, :department, :year)
    end
end
