class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy]


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_event(@user, "Created ")
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      log_event(@user, "Updated ")
      redirect_to @user
    else
      render :show
    end
  end

  def destroy
    log_event(@user, "Deleted ")
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def admin
    if current_user_admin?
      render :admin
    else
      redirect_to :index
    end
  end

private

  def require_correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user?(@user)
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirm)
  end
end
