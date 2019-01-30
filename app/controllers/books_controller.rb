class BooksController < ApplicationController

# before_action:
#     if @book.save
#       flash[:notice] = "successfully"
#     else
#       flash[:notice] = "error"
#     end

  def top
  	# if user_signed_in?
  	# 	redirect_to user_path(current_user)
  	# end
  end

  def index
    @books = Book.all
    @user = current_user
    @book_create = Book.new
  end

  def show

    @book_detail = Book.find(params[:id])
    @user = @book_detail.user
    @book_create = Book.new
  end

  def edit
  	@book_edit = Book.find(params[:id])
    if current_user.id != @book_edit.user_id
      redirect_to books_path
    end
  end
  def update
    @book_update = Book.find(params[:id])
    if @book_update.update(book_params)
      flash[:notice] = "successfully"
      redirect_to book_path(@book_update)
      else
      flash[:notice] = "error"
      @book_edit = Book.find(params[:id])
      render :edit
    end
  end

  def create
  	@book_create = current_user.books.new(book_params)
  	if @book_create.save
  		flash[:notice] = "successfully"
  		redirect_to book_path(@book_create)
  	else
  		flash[:notice] = "error"
      @books = Book.all
      @user = current_user
  		render :index
  	end
  end

  def destroy
    @book_destroy = Book.find(params[:id])
    if @book_destroy.destroy
    flash[:notice] = "successfully"
    redirect_to books_path
    else
    flash[:notice] = "error"
    @book_edit = Book.find(params[:id])
    render :edit
    end
  end

  private
  def book_params
  	params.require(:book).permit(:book_title,:opinion)
  end
end
