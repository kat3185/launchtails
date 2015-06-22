class FeaturedDrinksController < ApplicationController
  def index
    @drinks = Drink.page(params[:page])
  end
end
