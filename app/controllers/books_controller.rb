class BooksController < ApplicationController
	before_action :authenticate_user!,only: [:create,:edit,:index]
  #before_action :correct_user, only: [:create, :edit, :update]

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
      @books = Book.all
  	  @book = Book.new(book_params)
      @book.user_id = current_user.id
      if @book.save
        flash[:notice] = "your book was succesfully!"
        redirect_to book_path(@book.id)
      else
        render :index
      end
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
    @bookf = Book.find(params[:id])
    @bookf.destroy
    redirect_to books_path
 end


private
    def book_params
      params.require(:book).permit(:title, :opinion)
    end

    #def correct_user
      #user = User.find(params[:id])
      #if current_user != user
      #redirect_to root_path
      #end
    #end
end
