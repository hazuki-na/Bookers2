class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.new(user_params)
    @user.update(user_params)
    redirect_to user_url(@user.id)
  end
  
  private
   
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image_id)
  end
end
