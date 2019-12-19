class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  
  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
  if
    book.save!
    redirect_to user_url(current_user.id)
  else
    render action: :show
  end
  
  def index
    @book = Book.page(params[:book]).reverse_order
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
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
    redirect_to books_url(book.id)
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  end

end
