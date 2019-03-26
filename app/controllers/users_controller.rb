class UsersController < ApplicationController
  def index
      @users = User.all
      @user = User.new
  end

  def show
  	  @user = User.find(params[:id])
      @book = Book.find(params[:id])
      @books = @user.books
  end

  def create
      user = current_user.id
      redirect_to books_path
  end

  def edit
  	  @user = User.find(params[:id])
  end

  def update
  	  @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to user_edit_path(@user.id)
  end

  def destroy
      redirect_to root_path
  end


  private 
  def user_params
    params.require(:user).permit(:name, :profile, :profile_image)
  end
end
