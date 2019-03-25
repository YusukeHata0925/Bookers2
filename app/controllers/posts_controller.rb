class PostsController < ApplicationController

    def new
      @book = Book.new
    end


private
    def post_params
        params.require(:post).permit(:title, :body)
    end
end
