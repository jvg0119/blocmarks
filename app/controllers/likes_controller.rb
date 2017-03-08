class LikesController < ApplicationController
	before_action :set_bookmark, only: [:create, :destroy]
  def index
  end

  def create
  	like = current_user.likes.new(bookmark: @bookmark)
  	if like.save
  		flash[:notice] = "Glad you liked it."
  	else
  		flash[:error] = "There was an error liking. Please try again."
  	end
  	redirect_to request.referrer
  end

  def destroy
  	like = current_user.likes.find(params[:id])
  	if like.destroy
  		flash[:notice] = "Sorry."
  	else
  		flash[:error] = "There was an error unliking. Please try again."
  	end
  	redirect_to request.referrer
  end

  private
  def set_bookmark
  	@bookmark = Bookmark.friendly.find(params[:bookmark_id])
  end

end
