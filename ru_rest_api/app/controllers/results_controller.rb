class ResultsController < ApplicationController
  before_action :set_result, only: [:show, :update, :destroy]

  # GET /results
  def index
    @results = Result.all

    render json: @results
  end

  # GET /results/1
  def show
    render json: @result
  end

  # POST /results
  def create
    @result = Result.new(result_params)

    if @result.save
      render json: @result, status: :created, location: @result
    else
      render json: @result.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /results/1
  def update
    if @result.update(result_params)
      render json: @result
    else
      render json: @result.errors, status: :unprocessable_entity
    end
  end

  # DELETE /results/1
  def destroy
    @result.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def result_params
      params.permit(:exam_roll, :subject_code, :subject_result)
    end
end
