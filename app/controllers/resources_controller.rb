class ResourcesController < ApplicationController
  def create
    service = ResourceCreationService.new(vertical_params, category_params, course_params)
    result = service.create_resources

    if result
      render json: result, status: :created
    else
      render json: { error: 'Resource creation failed' }, status: :unprocessable_entity
    end
  end

  private

  def vertical_params
    params.require(:vertical).permit(:name)
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def course_params
    params.require(:course).permit(:name, :author)
  end
end
