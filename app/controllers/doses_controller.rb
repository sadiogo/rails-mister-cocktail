class DosesController < ApplicationController

  def new
    @dose = Dose.new
    respond_to do |format|
      format.js
    end
  end
end
