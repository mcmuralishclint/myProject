require 'rails_helper'

RSpec.describe "ResourceManagementService", type: :service do
  describe 'create' do
    it 'creates sucessfully if the params are valid' do
      vertical_params = {
        "name": "TEST_VERTICAL"
      }
      category_params = { "name": "TEST_CATEGORY" }
      course_params = { "name": "TEST_COURSE" }
      @resource_management_service = ResourceManagementService.new(vertical_params, category_params, course_params)
      result = @resource_management_service.create_resources
      expect(result).to_not eq(nil)
    end

    it 'returns nil if the params are not valid' do
      @resource_management_service = ResourceManagementService.new(nil, nil, nil)
      result = @resource_management_service.create_resources
      expect(result).to eq(nil)
    end
  end

  describe 'update' do
    before do
      @vertical = create(:vertical)
      @category = create(:category, vertical: @vertical)
      @course = create(:course, category: @category)
    end

    it 'update sucessfully if the params are valid' do


      vertical_params = {
        "name": "TEST_VERTICAL"
      }
      category_params = { "name": "TEST_CATEGORY" }
      course_params = { "name": "TEST_COURSE" }
      @resource_management_service = ResourceManagementService.new(vertical_params, category_params, course_params)
      result = @resource_management_service.update_resources(@vertical.id)
      expect(result).to_not eq(nil)
    end

    it 'returns nil if the params are not valid' do
      @resource_management_service = ResourceManagementService.new(nil, nil, nil)
      result = @resource_management_service.update_resources(@vertical.id)
      expect(result).to eq(nil)
    end
  end
end
