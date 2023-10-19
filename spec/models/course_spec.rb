require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'validation' do
    before(:each) do
      @vertical1 = Vertical.create!(name: "Vertical1")
      @category = Category.create!(name: "TEST Category", vertical_id: @vertical1.id, state: 0)
      @course = Course.create!(name: "TEST Course", author: "test author", category_id: @category.id, state: 0)
    end

    it 'is valid with a unique name' do
      course = Course.new(name: "Course2", category_id: @category.id)
      expect(course).to be_valid
    end

    it 'is not valid if the name matches a vertical' do
      course = Course.new(name: "Vertical1")
      expect(course).not_to be_valid
    end

    it 'is not valid if the name matches a category' do
      category = Course.new(name: "TEST Category")
      expect(category).not_to be_valid
    end

    it 'is not valid if the name matches another course' do
      category = Course.new(name: "TEST Course")
      expect(category).not_to be_valid
    end
  end
end
