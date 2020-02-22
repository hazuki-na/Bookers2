class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :currect_user, only: [:edit, :update]
  
  def index
    @book = Book.new
    @users = User.page(params[:page]).reverse_order
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  private
   
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def currect_user
    @user = User.find(params[:id])
    if current_user != @user
       redirect_to user_path(current_user)
    end
  end
end
