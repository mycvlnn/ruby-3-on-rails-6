class CategoriesController < ApplicationController
  before_action :find_user, except: [:index, :new, :create]

  def index
    @users = Category.all
  end

  def show
  end

  def new
    @user = Category.new
  end

  def edit
  end

  def create
    @user = Category.new(params[:user])
    if @user.save
      flash[:success] = "Category successfully created"
      redirect_to @user
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Category was successfully updated"
      redirect_to @user
    else
      flash[:error] = "Something went wrong"
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

    def find_user
      @user = Category.find(params[:id])
    end

end
