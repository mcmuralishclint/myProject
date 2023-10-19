class ResourceManagementService
  def initialize(vertical_params, category_params, course_params)
    @vertical_params = vertical_params
    @category_params = category_params
    @course_params = course_params
  end

  def create_resources
    ActiveRecord::Base.transaction do
      @vertical = create_vertical
      @category = create_category(@vertical)
      @course = create_course(@category)

      { vertical: @vertical, category: @category, course: @course }
    end
  rescue StandardError
    return nil
  end

  def update_resources(vertical_id)
    ActiveRecord::Base.transaction do
      vertical = Vertical.find_by(id: vertical_id)
      return unless vertical

      vertical.update(@vertical_params)
      vertical.category.update(@category_params)
      vertical.category.course.update(@course_params)

      { vertical: vertical, category: vertical.category, course: vertical.category.course }
    end
  rescue StandardError
    return nil
  end

  private

  def create_vertical
    Vertical.create!(@vertical_params)
  end

  def create_category(vertical)
    Category.create(@category_params.merge(vertical_id: vertical.id))
  end

  def create_course(category)
    Course.create(@course_params.merge(category_id: category.id))
  end
end
