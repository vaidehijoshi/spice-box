class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
  end

  def create
    @recipe = Recipe.create(recipe_params)

    if recipe.save
      redirect_to(recipe_path(recipe))
    else
      flash[:alert] = "Couldn't create recipe!"
      render :new
    end
  end

  def show
  end

  def destroy
    if recipe.destroy
      flash[:notice] = "Recipe deleted!"
    else
      flash[:alert] = "Couldn't delete recipe!"
    end

    redirect_to(recipes_path)
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :content)
  end

  def recipe
    @recipe ||= Recipe.where(id: params[:id]).first_or_initialize
  end
  helper_method :recipe
end
