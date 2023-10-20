class ResourcesController < ApplicationController
  def create
    vertical = Vertical.new(resource_creation_params)
    if vertical.save
      render json: vertical, status: :created
    else
      render json: vertical.errors, status: :unprocessable_entity
    end
  end

  def update
    service = ResourceManagementService.new(vertical_params, category_params, course_params)
    result = service.update_resources(params[:id])

    if result
      render json: result, status: :ok
    else
      render json: { error: 'Resource update failed' }, status: :unprocessable_entity
    end
  end

  private

  def resource_creation_params
    params.require(:vertical).permit(:name, categories_attributes: [:name, courses_attributes: [:name, :title]])
  end
end
