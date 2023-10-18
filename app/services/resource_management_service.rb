class ResourceManagementService
  def initialize(vertical_params, category_params, course_params)
    @vertical_params = vertical_params
    @category_params = category_params
    @course_params = course_params
  end

  def create_or_update_resources
    vertical = create_or_update_vertical(@vertical_params)
    category = create_or_update_category(@category_params, vertical)
    course = create_or_update_course(@course_params, category)

    { vertical: vertical, category: category, course: course }
  end

  private

  def create_or_update_vertical(params)
    create_or_update_resource(Vertical, params)
  end

  def create_or_update_category(params, vertical)
    params[:vertical_id] = vertical.id if vertical
    create_or_update_resource(Category, params)
  end

  def create_or_update_course(params, category)
    params[:category_id] = category.id if category
    create_or_update_resource(Course, params)
  end

  def create_or_update_resource(model_class, params)
    return nil unless params

    resource = model_class.find_or_initialize_by(id: params[:id])
    resource.assign_attributes(params)
    resource.save!
    resource
  end
end
