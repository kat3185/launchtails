class DrinksController < ApplicationController
  def new
    @drink = Drink.new
    # @alcohol_levels = ['Low', 'Medium', 'High']

  end

  def create
    @drink = Drink.new(drink_params)
    if @drink.save
      flash[:notice] = 'Drink added.'
      redirect_to drinks_path
    else
      render :new
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

  protected
  def drink_params
    params.require(:drink).permit(:title, :description, :category_id, :featured, :alcohol_level)
  end
end
