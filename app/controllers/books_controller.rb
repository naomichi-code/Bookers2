class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  before_action :authenticate_user!
  def show
      @book = Book.new
      @book_show = Book.find(params[:id])



    end

    def index
      @user = User.find(current_user.id)

      @books = Book.all
      @book = Book.new
    end

    def create
      @user = User.find(current_user.id)
      @books = Book.all
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      if @book .save
        redirect_to book_path(@book.id),notice: "You have creatad book successfully."
      else
        render :index
      end
    end

    def edit
      @book = Book.find_by(params[:id])
    end

    def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path

    end

    def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        redirect_to book_path(@book.id),notice: "You have updated book successfully."
      else
        render :edit
      end
    end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end

    private
    def correct_user
    book = Book.find(params[:id])
    if current_user != book.user_id
    redirect_to root_path
  end
end

end
