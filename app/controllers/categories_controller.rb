class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.where(id: params[:category_id])
    @drinks = Drink.where(category_id: params[:category_id])
  end

end
