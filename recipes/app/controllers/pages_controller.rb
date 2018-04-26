class PagesController < ApplicationController

  def home
    
  end

  def recipes
    @recipes = Recipe.all
  end

end
