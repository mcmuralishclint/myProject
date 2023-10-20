class VerticalsController < ApplicationController
  before_action :set_vertical, only: [:show]

  def index
    @verticals = Vertical.all
    render json: @verticals
  end

  def show
    render json: @vertical
  end

  def create
    binding.pry
    vertical = Vertical.new(vertical_creation_params)
    binding.pry
    if vertical.save
      render json: vertical, status: :created
    else
      render json: vertical.errors, status: :unprocessable_entity
    end
  end

  private

  def set_vertical
    @vertical = Vertical.find(params[:id])
  end

  def vertical_creation_params
    params.require(:vertical).permit(:name, categories_attributes: [:name, courses_attributes: [:name, :title]])
  end
end
