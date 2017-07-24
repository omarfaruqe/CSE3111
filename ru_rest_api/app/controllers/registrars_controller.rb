class RegistrarsController < ApplicationController
  before_action :set_registrar, only: [:show, :update, :destroy]

  # GET /registrars
  # GET /registrars
  def index
    @registrars = Registrar.all
    json_response(@registrars)
  end

  # POST /registrars
  def create
    @registrar = Registrar.create!(registrar_params)
    json_response(@registrar, :created)
  end

  # GET /registrars/:id
  def show
    json_response(@registrar)
  end

  # PUT /registrars/:id
  def update
    @registrar.update(registrar_params)
    head :no_content
  end

  # DELETE /registrars/:id
  def destroy
    @registrar.destroy
    head :no_content
  end

  private

  def registrar_params
    # whitelist params
    params.permit(:name, :about, :contact)
  end

  def set_registrar
    @registrar = Registrar.find(params[:id])
  end
end