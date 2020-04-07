class DosesController < ApplicationController

  def index
    @cocktail = Cocktail.find(params[:id]) # così gli diamo a disposiizione il cocktail
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail_id = params['cocktail_id']
    @dose.save
    redirect_to cocktail_path(@dose.cocktail)
  end

  def edit
    @dose = Dose.find(params[:id])
  end

  def update
    @dose = Dose.find(params[:id])
    @dose.update(dose_params)

    redirect_to cocktail_path(@dose.cocktail)
  end

  def destroy
    Dose.find(params[:id]).destroy

    redirect_to cocktail_path(params['cocktail_id'])
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
