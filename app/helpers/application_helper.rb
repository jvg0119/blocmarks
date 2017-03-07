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
		embedly_api = Embedly::API.new(key: ENV['EMBELDY_API_KEY'] )
		obj = embedly_api.oembed :url => url
		(obj.first.url).html_safe
	end

end

