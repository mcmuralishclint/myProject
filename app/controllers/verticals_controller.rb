class VerticalsController < ApplicationController
  before_action :set_vertical, only: [:show, :update]
  before_action :authorize_request

  def index
    @verticals = Vertical.all
    render json: @verticals
  end

  def show
    render json: @vertical
  end

  def create
    vertical = Vertical.new(vertical_params)
    if vertical.save
      render json: vertical, status: :created
    else
      render json: vertical.errors, status: :unprocessable_entity
    end
  end

  def update
    if @vertical.update(vertical_params)
      render json: @vertical, status: :ok
    else
      render json: @vertical.errors, status: :unprocessable_entity
    end
  end

  private

  def set_vertical
    @vertical = Vertical.find(params[:id])
  end

  def vertical_params
    params.require(:vertical).permit(:name, categories_attributes: [:id, :name, courses_attributes: [:id, :name, :author]])
  end
end
