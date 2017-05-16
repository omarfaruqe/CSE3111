class MagazinesController < ApplicationController
  before_action :set_magazine, only: [:show, :update, :destroy]

  # GET /magazines
  def index
    @magazines = Magazine.all

    render json: @magazines
  end

  # GET /magazines/1
  def show
    render json: @magazine
  end

  # POST /magazines
  def create
    @magazine = Magazine.new(magazine_params)

    if @magazine.save
      render json: @magazine, status: :created, location: @magazine
    else
      render json: @magazine.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /magazines/1
  def update
    if @magazine.update(magazine_params)
      render json: @magazine
    else
      render json: @magazine.errors, status: :unprocessable_entity
    end
  end

  # DELETE /magazines/1
  def destroy
    @magazine.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_magazine
      @magazine = Magazine.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def magazine_params
      params.permit(:title, :publish_date)
    end
end
