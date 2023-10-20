class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
  before_action :authorize_request

  def index
    @categories = Category.where(vertical_id: params[:vertical_id])
    render json: @categories
  end

  def show
    render json: @category
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
