class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
    
  def index
    @categories = Category.all

    render json: {
        categories: @categories
    }
  end

  def new
  end

  def create
    @category = Category.new(category_params)
    @category.save

    render json: {
        category: @category
    }
  end

  def edit
  end

  def update
    @category.update(category_params)

    render json: {
        category: @category
    }
  end

  def show
    render json: {
        category: @category
    }
  end

  def destroy
    @category.destroy
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find_by(id: params[:id])
  end
end
