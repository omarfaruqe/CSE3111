class JoiningFormsController < ApplicationController
  before_action :set_joining_form, only: [:show, :update, :destroy]

  # GET /joining_forms
  def index
    @joining_forms = JoiningForm.all

    render json: @joining_forms
  end

  # GET /joining_forms/1
  def show
    render json: @joining_form
  end

  # POST /joining_forms
  def create
    @joining_form = JoiningForm.new(joining_form_params)

    if @joining_form.save
      render json: @joining_form, status: :created, location: @joining_form
    else
      render json: @joining_form.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /joining_forms/1
  def update
    if @joining_form.update(joining_form_params)
      render json: @joining_form
    else
      render json: @joining_form.errors, status: :unprocessable_entity
    end
  end

  # DELETE /joining_forms/1
  def destroy
    @joining_form.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_joining_form
      @joining_form = JoiningForm.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def joining_form_params
      params.permit(:name, :student_ID, :father, :birth_date, :contact)
    end
end
