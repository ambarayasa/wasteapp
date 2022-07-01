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

    if @waste.save
      render json: {
        status: "true",
        code: 200,
        message: "Sucessfully added data",
        data: @waste
      }
    else
      render json: {
        status: "false",
        code: 404,
        message: "Failed to add data"
      }
    end
  end

  def edit
  end

  def update
    @waste.update(waste_params)

    if @waste.update(waste_params)
      render json: {
        status: "true",
        code: 200,
        message: "Sucessfully updated data",
        data: @waste
      }
    else
      render json: {
        status: "false",
        code: 404,
        message: "Failed to update data"
      }
    end
  end

  def show
    @waste = Waste.find_by(id: params[:id])

    render json: {
      waste: @waste,
      category: @waste.category
    }
  end

  def destroy
    @waste.destroy

    if @waste.destroy
      render json: {
        status: "true",
        code: 200,
        message: "Sucessfully deleted data",
      }
    else
      render json: {
        status: "false",
        code: 404,
        message: "Failed to delete data"
      }
    end
  end

  private
  def waste_params
    params.require(:wastes).permit(:name, :descriptions, :price, :category_id)
  end

  def set_waste
    @waste = Waste.find_by(id: params[:id])
  end
end
