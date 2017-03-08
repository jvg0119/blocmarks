class TopicsController < ApplicationController
	before_action :authenticate_user!#, except: [:index, :show]
	before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
  	@topics = Topic.all
    authorize @topics
  end

  def show
  	#@topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
    authorize @topic
  end

  def new
  	@topic = Topic.new
    authorize @topic
  end

  def create
  	#@topic = Topic.new(topic_params)
  	@topic = current_user.topics.new(topic_params)
    authorize @topic 
  	if @topic.save
  		flash[:notice] = "Your new topic was saved successfully!"
  		redirect_to @topic 
  	else
  		flash[:error] = "There was an error saving your topic. Please try again."  		
  		render :new
  	end
  end

  def edit
    authorize @topic 
  end

  def update
    authorize @topic 
    if @topic.update_attributes(topic_params)
      flash[:notice] = "Your topic was updated successfully!"
      redirect_to @topic
    else
      flash[:error] = "There was an error updating your topic. Please try again."     
      render :edit
    end
  end

  def destroy
  	#@topic = Topic.find(params[:id])
    authorize @topic
  	if @topic.destroy
  		flash[:notice] = "Your topic is deleted!"  		
  		redirect_to topics_path
  	else
  		flash[:error] = "There was an error deleting your topic. Please try again."
  		redirect_to topics_path
  	end
  end

  private

  def topic_params
  	params.require(:topic).permit(:title, :slug)
  end

  def set_topic
  	#@topic = Topic.find(params[:id])
    #@topic = Topic.find_by(slug: params[:id])
    @topic = Topic.friendly.find(params[:id])
  end

end




