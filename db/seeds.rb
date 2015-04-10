require 'faker'

#create Users
10.times do 
	user = User.new(
		username: Faker::Name.name,
		email: Faker::Internet.email,
	    password: Faker::Lorem.characters(6)
	)
	user.save!
end
users = User.all
#create Tasks

50.times do
	task = Task.create!(
		user: users.sample,
		description: Faker::Lorem.sentence
		)
	task.update_attributes!(created_at: rand(10.minutes .. 7.days).ago)
end
#
puts "Seed finished"
puts "#{User.count} users created"
puts "#{Task.count} tasks created"