class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "You created a new category!"
      redirect_to categories_path
    else
      flash[:notice] = "Your category could not be created as entered."
      render :new
    end
  end

  def show
    @category = Category.where(id: params[:category_id])
    @drinks = Drink.where(category_id: params[:category_id])
  end

  protected
  def category_params
    params.require(:category).permit(:name)
  end

end
