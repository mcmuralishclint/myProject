class UniquenessAcrossModelsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    if record.class == Category && (Vertical.exists?(name: value) || Course.exists?(name: value))
      record.errors.add(attribute, "has already been taken by a Vertical or Course")
    elsif record.class == Vertical && (Category.exists?(name: value) || Course.exists?(name: value))
      record.errors.add(attribute, "has already been taken by a Category or Course")
    elsif record.class == Course && (Vertical.exists?(name: value) || Category.exists?(name: value))
      record.errors.add(attribute, "has already been taken by a Vertical or Category")
    end
  end
end
