class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
  end

  def index
  end


private
def user_params
  params.require(:user).permit(:name, :introduction,:profile_image_id)
end


end