class BooksController < ApplicationController

# before_action:
#     if @book.save
#       flash[:notice] = "successfully"
#     else
#       flash[:notice] = "error"
#     end

  def top
	if user_signed_in?
		redirect_to user_path(current_user)
	end  	
  end
  def index
    @book = current_user
    @books = Book.all
    @book = Book.new
  end

  def edit
  	@book = current_user(book_params)
  end
  def create
  	@book = current_user.books.new(book_params)
  	if @book.save
  		flash[notice] = "successfully"
  		redirect_to user_path(current_user)
  	else
  		flash[:notice] = "error"
  		render user_path
  	end
  end
  private
  def book_params
  	params.require(:book).permit(:book_title,:opinion)
  end
end
