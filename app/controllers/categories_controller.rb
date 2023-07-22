class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = 'Category created successfully'
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      flash[:notice] = 'Category updated successfully'
      redirect_to categories_path
    else
      flash[:alert] = 'Categories update failed'
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:notice] = 'Category destroyed successfully'
    else
      flash[:alert] = @category.errors.full_messages.join(', ')
    end
    redirect_to posts_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end