class IdsController < ApplicationController
  before_action :set_id, only: [:show, :update, :destroy]

  # GET /ids
  def index
    @ids = Id.all

    render json: @ids
  end

  # GET /ids/1
  def show
    render json: @id
  end

  # POST /ids
  def create
    @id = Id.new(id_params)

    if @id.save
      render json: @id, status: :created, location: @id
    else
      render json: @id.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ids/1
  def update
    if @id.update(id_params)
      render json: @id
    else
      render json: @id.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ids/1
  def destroy
    @id.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_id
      @id = Id.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def id_params
      params.require(:id).permit(:name)
    end
end
