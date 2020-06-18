class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id),notice: "You have updated user successfully."
    else
      render :edit
    end
  end



private
def user_params
  params.require(:user).permit(:name, :introduction,:profile_image)
end
def correct_user
  micropost = User.find(current_user.id)
    unless micropost
      redirect_to  root_path
    end
end


end