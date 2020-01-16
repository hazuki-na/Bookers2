class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
  if
    @book.save
    redirect_to user_url(current_user.id)
  else
    render :index
  end
  
  end
  
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to user_url(current_user.id)
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_url
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
