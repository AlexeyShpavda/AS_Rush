class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @articles = Article.where(category_id: [@category.subtree_ids]).paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
    @categories = Category.all.order(:name)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, success: 'Category created successfully'
    else
      @categories = Category.all.order(:name)
      #flash[:danger] = 'Category is not created'
      render :new
    end
  end

  def edit
    @categories = Category.where("id != #{@category.id}").order(:name)
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to categories_path, success: 'Category updated successfully'
    else
      @categories = Category.where("id != #{@category.id}").order(:name)
      #flash[:danger] = 'Category is not updated'
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to @categories_path, success: 'Category deleted successfully'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end