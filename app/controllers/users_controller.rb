class UsersController < ApplicationController

  #before_action :authenticate_user!

   def show
     @my_bookmarks = current_user.bookmarks
     @my_bookmark_likes = current_user.bookmark_likes
   end

  def update
  	#@user = User.find(params[:id]) ## OK
  	#@user.update_attribute(user_params)
  	if current_user.update_attributes(user_params)
  	  flash[:notice] = "Your name was updated successfully!"
  	  redirect_to edit_user_registration_path
  	else
   	  flash[:error] = "There is a error updating your name. Please try again."
   	  redirect_to edit_user_registration_path
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name)
  end


end
