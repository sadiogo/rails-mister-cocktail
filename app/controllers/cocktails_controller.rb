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
    @cocktail_doses = Hash.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    @dose_keys = params.keys.select { |k| k.match(/dose\w/) }
    @dose_keys.each do |key|
      dose = Dose.new(dose_params(key))
      dose.cocktail = @cocktail
      dose.save
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def dose_params(key)
    params.require(key).permit(:description, :ingredient_id)
  end
end
