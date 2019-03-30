class UserController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def index
      @books = Book.all
      @book = Book.new
  end

  def show
  	  @user = User.find(params[:id])
   end

  def edit
  	  @user = User.find(params[:id])
  end

  def update
  	  @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to user_path(@user.id)
  end

  def destroy
      redirect_to root_path
  end



  private 
  def user_params
    params.require(:user).permit(:name, :profile, :profile_image)
  end

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to root_path
    end
  end

end
