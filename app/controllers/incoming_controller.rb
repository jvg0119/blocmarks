class IncomingController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:create]

	def create
		puts "INCOMING PARAMS HERE: #{params}"

		#sender = params["sender"]
		#body_plain = params["stripped-text"]


	 # Find the user by using params[:sender]
	 @user = User.find_by(email: params[:sender])

   # Find the topic by using params[:subject]
   @topic = Topic.find_by(title: params[:subject])
   
   # Assign the url to a variable after retreiving it from params["body-plain"]
   @url = params["body-plain"]

   # Check if user is nil, if so, create and save a new user

   # Check if the topic is nil, if so, create and save a new topic

   # Now that you're sure you have a valid user and topic, build and save a new bookmark

   @bookmark = @topic.bookmarks.new(url: @url, user: @user)
   @bookmark.save!

		head 200
	end

end	
