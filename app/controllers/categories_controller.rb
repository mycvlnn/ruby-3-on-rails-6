class CategoriesController < ApplicationController
  before_action :find_category, except: %i[index new create]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category successfully created"
      redirect_to @category
    else
      render 'new'
    end
  end

  def update
    if @category.update(category_params)
      flash[:success] = "Category was successfully updated"
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "Category was successfully deleted"
      redirect_to @users_path
    else
      flash[:error] = "Something went wrong"
      redirect_to @users_path
    end
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
