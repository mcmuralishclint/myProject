require 'rails_helper'

RSpec.describe Vertical, type: :model do
  context 'validation' do
    before(:each) do
      @vertical1 = Vertical.create!(name: "Vertical1")
      @category = Category.create!(name: "TEST Category", vertical_id: @vertical1.id, state: 0)
      @course = Course.create!(name: "TEST Course", author: "test author", category_id: @category.id, state: 0)
    end

    it 'is valid with a unique name' do
      vertical = Vertical.new(name: "Vertical2")
      expect(vertical).to be_valid
    end

    it 'is not valid if the name matches a category' do
      vertical = Vertical.new(name: "TEST Category")
      expect(vertical).not_to be_valid
    end

    it 'is not valid if the name matches a course' do
      vertical = Vertical.new(name: "TEST Course")
      expect(vertical).not_to be_valid
    end

    it 'is not valid if the name matches another vertical' do
      vertical = Vertical.new(name: "Vertical1")
      expect(vertical).not_to be_valid
    end
  end
end
