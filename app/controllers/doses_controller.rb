class DosesController < ApplicationController

  def index
    @cocktail = Cocktail.find(params[:id]) # così gli diamo a disposiizione il cocktail
  end

  def create
    ingredient = Ingredient.where(name: params['ingredient']).first
    Dose.create!(description: params["dose"], cocktail_id: params[:id], ingredient: ingredient)

    redirect_to "/#{params[:id]}"
  end

  def edit
    @dose = Dose.find(params[:dose_id])
  end

  def update
    @dose = Dose.find(params[:dose_id])
    @dose.update(description: params["dose"])

    redirect_to "/#{params[:id]}"
  end

  def destroy
    Dose.find(params[:dose_id]).delete

    redirect_to "/#{params[:id]}"
  end
end
