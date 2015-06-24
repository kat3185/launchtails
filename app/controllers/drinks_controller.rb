class DrinksController < ApplicationController

  # def categories_dropdown
  #   @categories_dropdown = Category.all.map { |a| [a.name, a.id] }
  #   return @categories_dropdown
  # end

  def new
    @drink = Drink.new
    @categories_dropdown = Category.all.map { |a| [a.name, a.id] }
    @alcohol_levels = ['Low', 'Medium', 'High']
  end

  def create
    @drink = Drink.new(drink_params)
    if @drink.save
      flash[:notice] = 'Drink added.'
      redirect_to drinks_path
    else
      flash[:notice] = "Title and description can't be blank."
      redirect_to new_drink_path
    end
  end

  def index
    @drinks = Drink.page(params[:page])
  end

  def destroy
    @drink = Drink.find(params[:id])
    @drink.destroy
    flash[:notice] = "Drink deleted."
    redirect_to drinks_path
  end

  def edit
    @drink = Drink.find(params[:id])
    @categories_dropdown = Category.all.map { |a| [a.name, a.id] }
    @alcohol_levels = ['Low', 'Medium', 'High']
  end

  def update
    @drink = Drink.find(params[:id])
    @drink.update(drink_params)
    if @drink.save
      flash[:notice] = 'Drink updated.'
      redirect_to drinks_path
    else
      flash[:notice] = "Title and description can't be blank."
      redirect_to edit_drink_path(@drink)
    end
  end

  protected
  def drink_params
    params.require(:drink).permit(:title, :description, :category_id, :featured, :alcohol_level)
  end

end
