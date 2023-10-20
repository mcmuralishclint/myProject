class CoursesController < ApplicationController
  before_action :set_course, only: [:show]
  before_action :authorize_request

  def index
    @courses = Course.where(category_id: params[:category_id])
    render json: @courses
  end

  def show
    render json: @course
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end
end
