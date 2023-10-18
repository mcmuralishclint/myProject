class ManagementController < ApplicationController
  def create_or_update_resources
    service = ResourceManagementService.new(vertical_params, category_params, course_params)
    result = service.create_or_update_resources

    render json: result
  end

  private

  def vertical_params
    params.require(:vertical).permit(:id, :name)
  end

  def course_params
    params.require(:course).permit(:id, :name, :author, :category_id, :state)
  end

  def category_params
    params.require(:category).permit(:id, :name, :state, :vertical_id)
  end
end
