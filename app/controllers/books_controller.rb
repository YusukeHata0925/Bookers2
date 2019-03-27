class BooksController < ApplicationController
	before_action :authenticate_user!,only: [:create,:edit,:index]
  def show
      @bookf = Book.find(params[:id])
      @book = Book.new
      @user = @bookf.user
  end

  def index
  	  @books = Book.all
  	  @book = Book.new
  end

  def new
      @book = Book.find(params[:id])
  	  @book = Book.new
      

  end

  def create
  	  book = Book.new(book_params)
      book.user_id = current_user.id
      book.save
      redirect_to book_path(book.id)
  end

  def edit
  	  @book = Book.find(params[:id])
  end

  def update
  	  book = Book.find(params[:id])
      book.update(book_params)
      redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
end


private
    def book_params
      params.require(:book).permit(:title, :opinion, :name, :profile_image)
    end

end
