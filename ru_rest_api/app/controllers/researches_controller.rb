class ResearchesController < ApplicationController
  before_action :set_research, only: [:show, :update, :destroy]

  # GET /researches
  def index
    @researches = Research.all

    render json: @researches
  end

  # GET /researches/1
  def show
    render json: @research
  end

  # POST /researches
  def create
    @research = Research.new(research_params)

    if @research.save
      render json: @research, status: :created, location: @research
    else
      render json: @research.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /researches/1
  def update
    if @research.update(research_params)
      render json: @research
    else
      render json: @research.errors, status: :unprocessable_entity
    end
  end

  # DELETE /researches/1
  def destroy
    @research.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_research
      @research = Research.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def research_params
      params.permit(:name, :topic)
    end
end
