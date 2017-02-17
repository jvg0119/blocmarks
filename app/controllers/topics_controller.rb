class TopicsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
  def index
  	@topics = Topic.all
  end

  def show
  	@topic = Topic.find(params[:id])
  end

  def new
  	@topic = Topic.new
  end

  def create
  	#@topic = Topic.new(topic_params)
  	@topic = current_user.topics.new(topic_params)
  	if @topic.save
  		flash[:notice] = "Your new topic was saved successfully!"
  		redirect_to @topic 
  	else
  		flash[:error] = "There was an error saving your topic. Please try again."  		
  		render :new
  	end
  end

  def edit
  end

  def destroy
  	@topic = Topic.find(params[:id])
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
  	params.require(:topic).permit(:title)
  end
end
