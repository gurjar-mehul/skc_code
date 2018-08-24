class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, except: :show
  before_action :find_user, only: [:show, :update, :destroy]

  def index
    @users = User.page(page_count).per(per_page)
  end

  def show
    unless current_user.admin?
      unless @user == current_user
        redirect_to root_path, alert: 'Access denied.'
      end
    end
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to users_path, notice: 'User updated.'
    else
      redirect_to users_path, alert:  'Unable to update user.'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'User destroyed successfully.'
  end

  private

  def admin_only
    unless current_user.admin?
      redirect_to root_path, alert: 'Access denied.'
    end
  end

  def user_params
    params.require(:user).permit(:role)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
