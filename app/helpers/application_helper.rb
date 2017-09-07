module ApplicationHelper

	def flash_class(key)
		case key
			when "success" then "alert alert-success" 	# green
			when "info" then "alert alert-info"			# blue
			when "notice" then "alert alert-info"		# blue
			when "warning" then "alert alert-warning"	# yellow
			when "alert" then "alert alert-warning"	 	# yellow
			when "danger" then "alert alert-danger"		# red
			when "error" then "alert alert-danger"		# red
		end
	end

require 'embedly'
require 'json'
	def display(url)
		#  turned off embedly due to reaching url limit it now gives a error
		embedly_api = Embedly::API.new(key: ENV['EMBELDY_API_KEY'] )
		obj = embedly_api.oembed :url => url
		(obj.first.url).html_safe
		
		# foo = (obj.first.url).html_safe
		# p '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@'
		# p foo
	end

	def home_active?(active_controller, active_action) # welcome controller and about index
		if active_controller == "welcome" && active_action == "index"
			"active"
		end
	end

	def topic_active?(active_controller)
		"active" if ["topics"].include?(active_controller) # TopicsController
	end

	def blocmarks_active?(active_controller)
		"active" if ["users"].include?(active_controller) # UsersController
	end

	def about_active?(active_controller, active_action) # welcome controller and about action
		if active_controller == "welcome" && active_action == "about"
			"active"
		end
	end

end
