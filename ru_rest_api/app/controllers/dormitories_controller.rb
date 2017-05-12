class DormitoriesController < ApplicationController
  before_action :set_dormitory, only: [:show, :update, :destroy]

  # GET /dormitories
  def index
    @dormitories = Dormitory.all

    render json: @dormitories
  end

  # GET /dormitories/1
  def show
    render json: @dormitory
  end

  # POST /dormitories
  def create
    @dormitory = Dormitory.new(dormitory_params)

    if @dormitory.save
      render json: @dormitory, status: :created, location: @dormitory
    else
      render json: @dormitory.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dormitories/1
  def update
    if @dormitory.update(dormitory_params)
      render json: @dormitory
    else
      render json: @dormitory.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dormitories/1
  def destroy
    @dormitory.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dormitory
      @dormitory = Dormitory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dormitory_params
      params.require(:dormitory).permit(:name)
    end
end
