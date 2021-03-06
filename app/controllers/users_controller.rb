class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def index
      @users = User.all
      @book = Book.new
  end

  def show
      @user = User.find(params[:id])
      @books = @user.books
      @book = Book.new
  end

  def edit
      @user = User.find(params[:id])

  end

  def update
      @user = User.find(params[:id])
      @user.update(user_params)
      if @user.save
        flash[:notice] = "Profile update was successfully!"
        redirect_to user_path(@user.id)
      else
        render :edit
      end
  end

  def destroy
      redirect_to user_path
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