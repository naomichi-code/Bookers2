class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = User.find_by(params[:id])
    @users = User.all
    @book = Book.new

  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end


private
def user_params
  params.require(:user).permit(:name, :introduction,:profile_image_id)
end


end