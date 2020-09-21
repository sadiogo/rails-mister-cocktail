class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end
  
  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @ingredients = Ingredient.all
    @cocktail = Cocktail.new
    @cocktail_doses = Hash.new(Dose.new)
  end
end
