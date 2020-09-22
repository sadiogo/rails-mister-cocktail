class DosesController < ApplicationController

  def new
    @ingredient = Ingredient.find(params[:id])
    @dose = Dose.new
    respond_to do |format|
      format.js
    end
  end
end
