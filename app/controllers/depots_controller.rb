class DepotsController < ApplicationController
  before_action :authenticate_and_set_user
  before_action :set_depot, only: %i[ show edit update destroy ]

  def index
    @depots = Depot.all

    render json: {
      depots: @depots
    }
  end

  def new
  end

  def create
    @depot = Depot.new(depot_params)
    @depot.save

    if @depot.save
      render json: {
        status: "true",
        code: 200,
        message: "Sucessfully added data",
        data: @depot
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
    @depot.update(depot_params)

    if @depot.update(depot_params)
      render json: {
        status: "true",
        code: 200,
        message: "Sucessfully updated data",
        data: @depot
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
    render json: {
      depot: @depot
    }
  end

  def destroy
    @depot.destroy
    
    if @depot.destroy
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
  def depot_params
    params.require(:depot).permit(:name, :address)
  end

  def set_depot
    @depot = Depot.find_by(id: params[:id])
  end
end
