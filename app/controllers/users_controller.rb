class UsersController < ApplicationController

	# before_action:
 #    if @user.save
 #      flash[:notice] = "successfully"
 #    else
 #      flash[:notice] = "error"
 #    end

  def index
  	@book = Book.new
  	@users = User.all
  end

  def edit
  	@user = current_user
  end

  def show
  	@book = Book.new
  	@books = Book.all

  end

  def update
  	user = User.find(params[:id])
  	user.update(user_params)
  	if user.save
  		flash[notice] = "successfully"
  		redirect_to user_path(current_user)
  	else
  		flash[:notice] = "error"
  		render edit_user_path
  	end
  end
  private
  def user_params
  	params.require(:user).permit(:image,:name,:introduction)
  end
end
