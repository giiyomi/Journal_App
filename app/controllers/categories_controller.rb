class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def  new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
    if @category.save
        format.html { redirect_to categories_url, notice: "Category was successfully added"}
    else
        format.html { render :new, status: :unprocessable_entity }
        end
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end