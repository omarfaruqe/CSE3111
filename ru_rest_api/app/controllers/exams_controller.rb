class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :update, :destroy]

  # GET /exams
  def index
    @exams = Exam.all
    json_response(@exams)
  end

  # POST /exams
  def create
    @exam = Exam.create!(exam_params)
    json_response(@exam, :created)
  end

  # GET /exams/:id
  def show
    json_response(@exam)
  end

  # PUT /exams/:id
  def update
    @exam.update(exam_params)
    head :no_content
  end

  # DELETE /exams/:id
  def destroy
    @exam.destroy
    head :no_content
  end

  private

  def exam_params
    # whitelist params
    params.permit(:exam_id, :time, :date, :length)
  end

  def set_exam
    @exam = Exam.find(params[:id])
  end
end