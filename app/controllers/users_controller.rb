class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show destory]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'Signup succcessfully!'
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

  def show; end

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
    redirect_to root_path
  end
end