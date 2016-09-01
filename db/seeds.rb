puts "Create admin ....."

User.create!(name: "Admin",
  email: "admin@framgia.com",
  password: "12345678",
  password_confirmation: "12345678",
  is_admin: true)

puts "Create user...."
9.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

puts "Create Following relationships...."
users = User.all
user  = users.first
following = users[2..5]
followers = users[3..4]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }


puts "Create category....."
Category.create!(name: "Mina No Nihongo N5")
Category.create!(name: "Mina No Nihongo N4")

Category.create! name:"Rails"
  10.times do |n|
  name  = Faker::Name.name
  Category.create! name: name
end

puts "Create words ..."
