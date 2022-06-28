class DepotsController < ApplicationController
  before_action :set_depot, only: %i[ show edit update destroy]

  def index
    @depots = Depot.all

    render json: {
      depots: @depots
    }
  end

  def new
    @depot = Depot.new
  end

  def create
    @depot = Depot.new(depot_params)
    @depot.save

    render json: {
      depot: @depot
    }
  end

  def edit
  end

  def update
    @depot.update(depot_params)

    render json: {
      depot: @depot
    }
  end

  def show
    render json: {
      depot: @depot
    }
  end

  def destroy
    @depot.destroy
    render json: 200
  end

  private
  def depot_params
    params.require(:depot).permit(:name, :address)
  end

  def set_depot
    @depot = Depot.find_by(id: params[:id])
  end
end
