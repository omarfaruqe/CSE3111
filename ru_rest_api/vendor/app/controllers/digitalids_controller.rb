class DigitalidsController < ApplicationController
  before_action :set_digitalid, only: [:show, :update, :destroy]

  # GET /digitalids
  def index
    @digitalids = Digitalid.all

    render json: @digitalids
  end

  # GET /digitalids/1
  def show
    render json: @digitalid
  end

  # POST /digitalids
  def create
    @digitalid = Digitalid.new(digitalid_params)

    if @digitalid.save
      render json: @digitalid, status: :created, location: @digitalid
    else
      render json: @digitalid.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /digitalids/1
  def update
    if @digitalid.update(digitalid_params)
      render json: @digitalid
    else
      render json: @digitalid.errors, status: :unprocessable_entity
    end
  end

  # DELETE /digitalids/1
  def destroy
    @digitalid.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_digitalid
      @digitalid = Digitalid.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def digitalid_params
      params.require(:digitalid).permit(:changeprocess)
    end
end
