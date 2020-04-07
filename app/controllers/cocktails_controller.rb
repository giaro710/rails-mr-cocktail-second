class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
    @reviews = Review.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @reviews = Review.all
    @review = Review.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    cocktail = Cocktail.create(name: params['cocktail'])
    ingredient = Ingredient.where(name: params['ingredient']).first
    Dose.create(description: params['dose'], cocktail: cocktail, ingredient: ingredient)

    redirect_to root_path
  end

  def destroy
    cocktail = Cocktail.find(params[:id])
    cocktail.delete
    redirect_to root_path
  end

  private

  def set_cocktails
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end


end
