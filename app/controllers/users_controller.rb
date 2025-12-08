class UsersController < ApplicationController
  before_action :require_user, only: %i[edit update]
  before_action :set_user, only: %i[edit update show destroy]
  before_action :require_same_user, only: %i[edit update]

  def index
    @users = User.paginate(page: params[:page], per_page: 5).preload(:articles)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'Signup succcessfully!'
      session[:user_id] = @user.id
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = 'User was updated successfully'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def destroy
    if @user.destroy
      flash[:success] = 'Account and all associated articles successfully deleted'
      session[:user_id] = nil
    else
      flash[:error] = 'Something went wrong when delete account'
    end

    redirect_to articles_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  # Xử lý trong trường hợp không tìm thấy user
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'User not found!'
    # Di chuyển về trang home nếu không tìm thấy
    redirect_to users_path
  end

  def require_same_user
    unless current_user == @user
      flash[:error] = 'You can only update your own profile'
      redirect_to users_path
    end
  end
end