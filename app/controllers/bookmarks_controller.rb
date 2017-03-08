class BookmarksController < ApplicationController
	before_action :set_topic
	before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
 #  def show
  #   authorize @bookmark  # it's here but not using show
 #  end

  def new
  	@bookmark = @topic.bookmarks.new
    authorize @bookmark
  end

  def create
  	@bookmark = @topic.bookmarks.new(bookmark_params)
    @bookmark.user = current_user
    #authorize @bookmark
  	if @bookmark.save
      @bookmark.likes.create!(user: current_user)
  		flash[:notice] = "Your new bookmark was saved successfully!"
  		redirect_to topic_path(@topic) #[@topic, @bookmark] 
  	else
  		flash[:error] = "There was an error saving your bookmark. Please try again."
  		render :new
  	end  		
  end

  def edit
    authorize @bookmark
  end

  def update
    authorize @bookmark
	  if @bookmark.update_attributes(bookmark_params)
  		flash[:notice] = "Your new bookmark was updated successfully!"
  		redirect_to @topic#[@topic, @bookmark] 
  	else
  		flash[:error] = "There was an error updating your bookmark. Please try again."
  		render :edit
  	end  			  	
  end	

  def destroy
    authorize @bookmark
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
  	@topic = Topic.friendly.find(params[:topic_id])
  end

  def set_bookmark
    #@bookmark = @topic.bookmarks.find(params[:id])
    @bookmark = @topic.bookmarks.friendly.find(params[:id])
  end

  def bookmark_params
  	params.require(:bookmark).permit(:url)
  end
end
