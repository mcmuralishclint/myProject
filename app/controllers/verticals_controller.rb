class VerticalsController < ApplicationController
  before_action :set_vertical, only: [:show]

  def index
    @verticals = Vertical.all
    render json: @verticals
  end

  def show
    render json: @vertical
  end

  private

  def set_vertical
    @vertical = Vertical.find(params[:id])
  end
end
