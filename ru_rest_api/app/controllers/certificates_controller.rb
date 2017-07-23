class CertificatesController < ApplicationController
  before_action :set_certificate, only: [:show, :update, :destroy]

  # GET /certificates
  def index
    @certificates = Certificate.all
    json_response(@certificates)
  end

  # POST /certificates
  def create
    @certificate = Certificate.create!(certificate_params)
    json_response(@certificate, :created)
  end

  # GET /certificates/:id
  def show
    json_response(@certificate)
  end

  # PUT /certificates/:id
  def update
    @certificate.update(certificate_params)
    head :no_content
  end

  # DELETE /certificates/:id
  def destroy
    @certificate.destroy
    head :no_content
  end

  private

  def certificate_params
    # whitelist params
    params.permit(:name, :shift, :duration, :requirement)
  end

  def set_certificate
    @certificate = Certificate.find(params[:id])
  end
end