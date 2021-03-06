# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




# users
u1 = User.new(name: "Joe", email: "joe@example.com", password: "password")
u1.skip_confirmation!
u1.save!

# u2 = User.new(name: "Kelly", email: "kelly@example.com", password: "password")
# u2.skip_confirmation!
# u2.save!
#
# u3 = User.new(name: "Mike", email: "mike@example.com", password: "password")
# u3.skip_confirmation!
# u3.save!
#
# u4 = User.new(name: "Admin", email: "admin@example.com", password: "password", role: 'admin')
# u4.skip_confirmation!
# u4.save!

#users = [u1,u2, u3]

topic1 = Topic.create(title: "Search Engines", user: u1)
	# bookmark1 = Bookmark.create(url: "google.com", topic: topic1, user: u1)
	# 	Like.create(bookmark: bookmark1, user: u1)
	# bookmark2 = Bookmark.create(url: "yahoo.com", topic: topic1, user: u1)
	# 	Like.create(bookmark: bookmark2, user: u1)
	# bookmark3 = Bookmark.create(url: "bing.com", topic: topic1, user: u1)
	# 	Like.create(bookmark: bookmark3, user: u1)

topic2 = Topic.create(title: "Social Sites", user: u1)
	# bookmark4 = Bookmark.create(url: "facebook.com", topic: topic2, user: u2)
	# 	Like.create(bookmark: bookmark4, user: u2)
	# bookmark5 = Bookmark.create(url: "linkedin.com", topic: topic2, user: u2)
	# 	Like.create(bookmark: bookmark5, user: u2)

# topics
# topics = []
# 1.upto(5) do
# 	user = users.sample
# 	topic =  Topic.create(title: "#{Faker::Hipster.sentence}", user: user )
# 	topics << topic
# end

# bookmark url
# 1.upto(20) do
# 	topic = topics.sample
# 	user = users.sample
# 	bookmark = Bookmark.create(url: "#{Faker::Internet.url}", topic: topic, user: user)
# 		Like.create(bookmark: bookmark, user: user)
# end


puts "*".center(40,"*")
puts
puts "#{User.count} users created".center(40," ")
puts "#{Topic.count} topics created".center(40," ")
puts "#{Bookmark.count} bookmark url created".center(40," ")
puts
puts " Done seeding ".center(40," ")
puts
puts "*".center(40,"*")
