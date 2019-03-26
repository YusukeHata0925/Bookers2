class BooksController < ApplicationController
	before_action :authenticate_user!,only: [:create,:edit,:index]
  def show
      @book = Book.find(params[:id]) 
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
  	  @book = Book.find(params[:id])
  end

  def update
  	  @book = Book.find(params[:id])
      @book.update(book_params)
      redirect_to book_show_path(@book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
end


private
    def book_params
      params.require(:book).permit(:title, :body,:name, :profile_image)
    end

end
