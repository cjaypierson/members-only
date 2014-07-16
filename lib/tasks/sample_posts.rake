namespace :db do
	desc "Fill database with sample users and posts"
	task populate: :environment do
		User.create(name: "aAron",
							  email: "aaron@example.com",
							  password: "soccer",
							  password_confirmation: "soccer")
		49.times do |u|
			name = Faker::Name.name
			email = Faker::Internet.email
			password = "password"
			password_confirmation = "password"
			user = User.new(name: name,
								   email: email,
								   password: password,
								   password_confirmation: password)
			user.save!

			(rand(1..5)).times do |p| 
				title = Faker::Lorem.sentence
				body = Faker::Lorem.paragraph
				user.posts.create!(title: title,
												 body: body)
			end
		end
	end
end
			


