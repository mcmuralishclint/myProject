require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validation' do
    before(:each) do
      @vertical = Vertical.create!(name: "Vertical1")
      @category = Category.create!(name: "TEST Category", vertical_id: @vertical.id, state: 0)
      @course = Course.create!(name: "TEST Course", author: "test author", category_id: @category.id, state: 0)
    end

    it 'is valid with a unique name' do
      category = Category.new(name: "Category 1", vertical_id: @vertical.id)
      expect(category).to be_valid
    end

    it 'is not valid if the name matches a vertical' do
      category = Category.new(name: "Vertical1")
      expect(category).not_to be_valid
    end

    it 'is not valid if the name matches a course' do
      category = Category.new(name: "TEST Course")
      expect(category).not_to be_valid
    end

    it 'is not valid if the name matches another category' do
      category = Category.new(name: "TEST Category")
      expect(category).not_to be_valid
    end
  end
end
