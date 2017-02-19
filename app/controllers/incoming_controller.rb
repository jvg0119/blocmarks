class IncomingController < ApplicationController
	skip_before_action :verify_authenticity_token, only: [:create]

	def create
		puts "INCOMING PARAMS HERE: #{params}"

		#sender = params["sender"]
		#body_plain = params["stripped-text"]

	 # Find the user by using params[:sender]
	 # Check if user is nil, if so, create and save a new user
	 @user = User.find_by(email: params[:sender])
		 if @user.nil?
		 		@user = User.new(email: params[:sender], password: "password")
		 		@user.skip_confirmation!
		 		@user.save!
		 	end

   # Find the topic by using params[:subject]
   # Check if the topic is nil, if so, create and save a new topic
   @topic = Topic.find_by(title: params[:subject])
     if @topic.nil?
     	 @topic.user = @user
     	 @topic = Topic.new(title: params[:subject], user: @user) 
     	 @topic.save!
     end

   # Assign the url to a variable after retreiving it from params["body-plain"]
   # Now that you're sure you have a valid user and topic, build and save a new bookmark
   @url = params["body-plain"]

   @bookmark = @topic.bookmarks.new(url: @url)
   @bookmark.save!

		head 200
	end

end	
