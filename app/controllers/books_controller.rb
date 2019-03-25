class BooksController < ApplicationController
	before_action :authenticate_user!,only: [:create,:edit,:index]
  def show
  end

  def index
  	  @books = Book.all
  	  @book = Book.new
  	  @user = current_user
  end

  def new
  	  @book = Book.new
  end

  def create
  	  book = Book.new(book_params)
      book.save
      redirect_to books_path
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
    book = Book.find(params[:id])
    book.destroy
    redirect_to book_path
end


private
    def book_params
      params.require(:book).permit(:title, :body,:name, :profile_image)
    end

end
