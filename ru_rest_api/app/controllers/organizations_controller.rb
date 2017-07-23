class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :update, :destroy]

  # GET /organizations
  def index
    @organizations = Organization.all
    json_response(@organizations)
  end

  # POST /organizations
  def create
    @organization = Organization.create!(organization_params)
    json_response(@organization, :created)
  end

  # GET /organizations/:id
  def show
    json_response(@organization)
  end

  # PUT /organizations/:id
  def update
    @organization.update(organization_params)
    head :no_content
  end

  # DELETE /organizations/:id
  def destroy
    @organization.destroy
    head :no_content
  end

  private

  def organization_params
    # whitelist params
    params.permit(:name, :organization_type, :total_member, :objective_and_policy)
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end
end