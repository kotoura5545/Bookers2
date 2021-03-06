class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?
# before_action :set_current_user
protected

	# def set_current_user
	#   @current_user = User.find_by(id: session[:user_id])
	# end

	def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
	    # devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
	end

	def after_sign_in_path_for(resource)
	user_path(current_user)
	end

	def after_sign_out_path_for(resource)
	root_path
	end

	def ensure_correct_user
	@book = User.find_by(id:params[:id])
	if @book.user_id != @current_user.id
	  flash[:notice] = "権限がありません"
	  redirect_to("/")
	end
	end
end