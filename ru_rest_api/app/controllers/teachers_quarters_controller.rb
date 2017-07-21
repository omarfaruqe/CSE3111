class TeachersQuartersController < ApplicationController
  before_action :set_teachers_quarter, only: [:show, :update, :destroy]

  # GET /teachers_quarters
  def index
    @teachers_quarters = TeachersQuarter.all

    render json: @teachers_quarters
  end

  # GET /teachers_quarters/1
  def show
    render json: @teachers_quarter
  end

  # POST /teachers_quarters
  def create
    @teachers_quarter = TeachersQuarter.new(teachers_quarter_params)

    if @teachers_quarter.save
      render json: @teachers_quarter, status: :created, location: @teachers_quarter
    else
      render json: @teachers_quarter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teachers_quarters/1
  def update
    if @teachers_quarter.update(teachers_quarter_params)
      render json: @teachers_quarter
    else
      render json: @teachers_quarter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teachers_quarters/1
  def destroy
    @teachers_quarter.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teachers_quarter
      @teachers_quarter = TeachersQuarter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def teachers_quarter_params
      params.permit(:name, :block, :location)
    end
end
