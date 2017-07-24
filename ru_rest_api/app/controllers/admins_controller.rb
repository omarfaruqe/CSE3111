class AdminsController < ApplicationController
  before_action :set_admin, only: [:update]
  # PATCH/PUT /admins/1
  def update
    if @admin.update(admin_params)
      render json: @admin
    else
      render json: @admin.errors, status: :unprocessable_entity
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.first
    end

    # Only allow a trusted parameter "white list" through.
    def admin_params
      params.require(:admin).permit(:token)
    end
end
