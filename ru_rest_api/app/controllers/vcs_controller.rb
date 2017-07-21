class VcsController < ApplicationController
  before_action :set_vc, only: [:show, :update, :destroy]

  # GET /vcs
  def index
    @vcs = Vc.all

    render json: @vcs
  end

  # GET /vcs/1
  def show
    render json: @vc
  end

  # POST /vcs
  def create
    @vc = Vc.new(vc_params)

    if @vc.save
      render json: @vc, status: :created, location: @vc
    else
      render json: @vc.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vcs/1
  def update
    if @vc.update(vc_params)
      render json: @vc
    else
      render json: @vc.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vcs/1
  def destroy
    @vc.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vc
      @vc = Vc.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vc_params
      params.permit(:name, :department, :year)
    end
end
# # #