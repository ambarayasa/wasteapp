class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
    
  def index
    @categories = Category.all

    render json: {
        data: @categories
    }
  end

  def new
  end

  def create
    @category = Category.new(category_params)
    @category.save

    if @category.save
        render json: {
          status: "true",
          code: 200,
          message: "Sucessfully added data",
          data: @category
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
    @category.update(category_params)

    if @category.update
      render json: {
        status: "true",
        code: 200,
        message: "Sucessfully updated data",
        data: @category
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
        data: @category
    }
  end

  def destroy
    @category.destroy

    if @category.destroy
      render json: {
        status: "true",
        code: 200,
        message: "Sucessfully deleted data"
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
  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find_by(id: params[:id])
  end
end
