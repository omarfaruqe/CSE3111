class HolidaysController < ApplicationController
  before_action :set_holiday, only: [:show, :update, :destroy]

  # GET /holidays
  def index
    @holidays = Holiday.all

    render json: @holidays
  end

  # GET /holidays/1
  def show
    render json: @holiday
  end

  # POST /holidays
  def create
    @holiday = Holiday.new(holiday_params)

    if @holiday.save
      render json: @holiday, status: :created, location: @holiday
    else
      render json: @holiday.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /holidays/1
  def update
    if @holiday.update(holiday_params)
      render json: @holiday
    else
      render json: @holiday.errors, status: :unprocessable_entity
    end
  end

  # DELETE /holidays/1
  def destroy
    @holiday.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_holiday
      @holiday = Holiday.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def holiday_params
      params.permit(:reason, :starting_date, :ending_date)
    end
end
