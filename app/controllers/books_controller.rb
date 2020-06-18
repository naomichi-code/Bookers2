class BooksController < ApplicationController
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
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      if @book .save
        redirect_to book_path(@book.id),notice: "You have creatad book successfully."
      else
        render :index
      end
    end

    def edit

    end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end


end
