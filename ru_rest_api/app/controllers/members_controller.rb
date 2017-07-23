class MembersController < ApplicationController
    before_action :set_member, only: [:show, :update, :destroy]

  # GET /members
  def index
    @members = Member.all
    json_response(@members)
  end

  # POST /members
  def create
    @member = Member.create!(member_params)
    json_response(@member, :created)
  end

  # GET /members/:id
  def show
    json_response(@member)
  end

  # PUT /members/:id
  def update
    @member.update(member_params)
    head :no_content
  end

  # DELETE /members/:id
  def destroy
    @member.destroy
    head :no_content
  end

  private

  def member_params
    # whitelist params
    params.permit(:name, :stdId, :contactInfo, :memberStatus)
  end

  def set_member
    @member = Member.find(params[:id])
  end
end
