class BookmarksController < ApplicationController
	before_action :set_topic
	before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
  def show
  	#@topic = Topic.find(params[:topic_id])
  	#@bookmark = @topic.bookmarks.find(params[:id])
  end

  def new
  	#@topic = Topic.find(params[:topic_id])
  	@bookmark = @topic.bookmarks.new
  end

  def create
  	#@topic = Topic.find(params[:topic_id])
  	@bookmark = @topic.bookmarks.new(bookmark_params)
  	if @bookmark.save
  		flash[:notice] = "Your new bookmark was saved successfully!"
  		redirect_to [@topic, @bookmark] 
  	else
  		flash[:error] = "There was an error saving your bookmark. Please try again."
  		render :new
  	end  		
  end

  def edit
  end

  def update
	  if @bookmark.update_attributes(bookmark_params)
  		flash[:notice] = "Your new bookmark was updated successfully!"
  		redirect_to [@topic, @bookmark] 
  	else
  		flash[:error] = "There was an error updating your bookmark. Please try again."
  		render :edit
  	end  			  	
  end	

  def destroy
  	#@topic = Topic.find(params[:topic_id])
  	#@bookmark = @topic.bookmarks.find(params[:id])
  	if @bookmark.destroy
  		flash[:notice] = "Your bookmark was deleted!"
  		redirect_to @topic
  	else
  		flash[:error] = "There was an deleting your bookmark. Please try again."
  		render :back
  	end  		  
  end

  private
  def set_topic
  	@topic = Topic.find(params[:topic_id])
  end

  def set_bookmark
  	@bookmark = @topic.bookmarks.find(params[:id])
  end

  def bookmark_params
  	params.require(:bookmark).permit(:url)
  end
end
