class SeatPlansController < ApplicationController
  before_action :set_seat_plan, only: [:show, :update, :destroy]

  # GET /seat_plans
  def index
    @seat_plans = SeatPlan.all

    render json: @seat_plans
  end

  # GET /seat_plans/1
  def show
    render json: @seat_plan
  end

  # POST /seat_plans
  def create
    @seat_plan = SeatPlan.new(seat_plan_params)

    if @seat_plan.save
      render json: @seat_plan, status: :created, location: @seat_plan
    else
      render json: @seat_plan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /seat_plans/1
  def update
    if @seat_plan.update(seat_plan_params)
      render json: @seat_plan
    else
      render json: @seat_plan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /seat_plans/1
  def destroy
    @seat_plan.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seat_plan
      @seat_plan = SeatPlan.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def seat_plan_params
      params.permit(:building_name, :floor_no, :room_no, :specific_seat_no)
    end
end
