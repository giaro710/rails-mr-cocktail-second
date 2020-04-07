class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
    @reviews = Review.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new(cocktail: @cocktail)
    @reviews = Review.all
    @review = Review.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    cocktail = Cocktail.create(cocktail_params)

    redirect_to cocktail_path(cocktail.id)
  end

  def destroy
    cocktail = Cocktail.find(params[:id])
    cocktail.destroy
    redirect_to root_path
  end

  private

  def set_cocktails
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end


end
