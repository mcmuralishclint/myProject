class ResourceCreationService
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
