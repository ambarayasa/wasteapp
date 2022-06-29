class WastesController < ApplicationController
  before_action :set_waste, only: %i[ show edit update destroy]

  def index
    @wastes = Waste.all

    render json: {
      wastes: @wastes
    }
  end

  def new
  end

  def create
    @waste = Waste.new(waste_params)
    @waste.save

    render json: {
      waste: @waste
    }
  end

  def edit
  end

  def update
    @waste.update(waste_params)

    render json: {
      waste: @waste
    }
  end

  def show
    @waste = Waste.find_by(id: params[:id])

    render json: {
      waste: @waste,
      category: @waste.category
    }
  end

  def delete
    @waste.destroy

    render json: 200
  end

  private
  def waste_params
    params.require(:wastes).permit(:name, :descriptions, :price, :category_id)
  end

  def set_waste
    @waste = Waste.find_by(id: params[:id])
  end
end
