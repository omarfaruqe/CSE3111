class ExternalCoursesController < ApplicationController
  before_action :set_external_course, only: [:show, :update, :destroy]

  # GET /external_courses
  def index
    @external_courses = ExternalCourse.all

    render json: @external_courses
  end

  # GET /external_courses/1
  def show
    render json: @external_course
  end

  # POST /external_courses
  def create
    @external_course = ExternalCourse.new(external_course_params)

    if @external_course.save
      render json: @external_course, status: :created, location: @external_course
    else
      render json: @external_course.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /external_courses/1
  def update
    if @external_course.update(external_course_params)
      render json: @external_course
    else
      render json: @external_course.errors, status: :unprocessable_entity
    end
  end

  # DELETE /external_courses/1
  def destroy
    @external_course.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_external_course
      @external_course = ExternalCourse.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def external_course_params
      params.permit(:course_type)
    end
end
