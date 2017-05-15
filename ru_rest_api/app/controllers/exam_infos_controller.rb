class ExamInfosController < ApplicationController
  before_action :set_exam_info, only: [:show, :update, :destroy]

  # GET /exam_infos
  def index
    @exam_infos = ExamInfo.all

    render json: @exam_infos
  end

  # GET /exam_infos/1
  def show
    render json: @exam_info
  end

  # POST /exam_infos
  def create
    @exam_info = ExamInfo.new(exam_info_params)

    if @exam_info.save
      render json: @exam_info, status: :created, location: @exam_info
    else
      render json: @exam_info.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exam_infos/1
  def update
    if @exam_info.update(exam_info_params)
      render json: @exam_info
    else
      render json: @exam_info.errors, status: :unprocessable_entity
    end
  end

  # DELETE /exam_infos/1
  def destroy
    @exam_info.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam_info
      @exam_info = ExamInfo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def exam_info_params
      params.permit(:exam_date, :time_duration, :exam_time, :Exam_roll)
    end
end
