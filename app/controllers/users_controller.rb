class UsersController < ApplicationController

	# before_action:
 #    if @user.save
 #      flash[:notice] = "successfully"
 #    else
 #      flash[:notice] = "error"
 #    end

  before_action :authenticate_user!

  def index
  	@book_create = Book.new
  	@user = current_user
  	@users = User.all
  end

  def edit
  	@user_edit = User.find(params[:id])
    if current_user.id != @user_edit.id
      redirect_to books_path
    end
  end

  def show
  	@book_create = Book.new
  	@user = User.find(params[:id])
  	@user_books = @user.books
  end

  def update
  	@user_edit = User.find(params[:id])
  	if @user_edit.update(user_params)
  		flash[:notice] = "successfully"
  		redirect_to user_path(current_user)
  	else
  		flash[:notice] = "error"
  		render :edit
  	end
  end
  private
  def user_params
  	params.require(:user).permit(:image,:name,:introduction)
  end
end
