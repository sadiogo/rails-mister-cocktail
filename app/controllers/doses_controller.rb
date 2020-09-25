class DosesController < ApplicationController

  def new
    @ingredient = Ingredient.find(params[:id])
    @doses = Hash.new(Dose.new)
    render partial: "doses/new", locals: { id: @ingredient.id }
    # respond_to do |format|
    #   format.js
    # end
  end

  def create
    raise
  end

  private

  def doses_params
    params.permit(:params, :cocktail)
  end
end
