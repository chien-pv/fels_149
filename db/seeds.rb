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

puts "Create Category ....."

Category.create!(name: "Basic 200", description: Faker::Lorem.paragraph)
Category.create!(name: "Basic 500", description: Faker::Lorem.paragraph)


Category.create! name:"Rails"
  10.times do |n|
  name  = Faker::Name.name
  description = Faker::Lorem.paragraph
  Category.create! name: name, description: description
end

puts "Create lesson ....."

Lesson.create!(user_id: 1, category_id: 1)
Lesson.create!(user_id: 2, category_id: 1)

puts "Create word ....."

Word.create!(content: "Hello", category_id: 1)
Word.create!(content: "Good morning", category_id: 1)
Word.create!(content: "Good afternoon", category_id: 1)
Word.create!(content: "She", category_id: 1)
Word.create!(content: "He", category_id: 1)

Word.create!(content: "Good Bye", category_id: 2)
Word.create!(content: "How are you?", category_id: 2)
Word.create!(content: "What your name?", category_id: 2)
Word.create!(content: "Thank you", category_id: 2)

puts "Create answer ....."

Answer.create!(content: "xin chào, lần đầu tiên gặp mặt",
  is_correct: true, word_id: 1)
Answer.create!(content: "chào buổi trưa",
  is_correct: false, word_id: 1)
Answer.create!(content: "chào buổi sáng",
  is_correct: false, word_id: 1)
Answer.create!(content: "rất mong được giúp đỡ",
  is_correct: false, word_id: 1)
Answer.create!(content: "chào buổi sáng",
  is_correct: true, word_id: 2)
Answer.create!(content: "chào buổi tối",
  is_correct: false, word_id: 2)
Answer.create!(content: "tôi đã về",
  is_correct: false, word_id: 2)
Answer.create!(content: "rất mong được giúp đỡ",
  is_correct: false, word_id: 2)
Answer.create!(content: "chào buổi trưa",
  is_correct: true, word_id: 3)
Answer.create!(content: "tôi đã về",
  is_correct: false, word_id: 3)
Answer.create!(content: "chào buổi sáng",
  is_correct: false, word_id: 3)
Answer.create!(content: "chào buổi tối",
  is_correct: false, word_id: 3)
Answer.create!(content: "chào buổi tối",
  is_correct: true, word_id: 4)
Answer.create!(content: "chào buổi trưa",
  is_correct: false, word_id: 4)
Answer.create!(content: "chào buổi sáng",
  is_correct: false, word_id: 4)
Answer.create!(content: "tôi đã về",
  is_correct: false, word_id: 4)
Answer.create!(content: "Cô ấy",
  is_correct: true, word_id: 5)
Answer.create!(content: "bạn",
  is_correct: false, word_id: 5)
Answer.create!(content: "người ấy",
  is_correct: false, word_id: 5)
Answer.create!(content: "tôi đã về",
  is_correct: false, word_id: 5)

Answer.create!(content: "chào buổi sáng",
  is_correct: true, word_id: 6)
Answer.create!(content: "chào buổi tối",
  is_correct: false, word_id: 6)
Answer.create!(content: "tôi đã về",
  is_correct: false, word_id: 6)
Answer.create!(content: "rất mong được giúp đỡ",
  is_correct: false, word_id: 6)
Answer.create!(content: "xin chào, lần đầu tiên gặp mặt",
  is_correct: true, word_id: 7)
Answer.create!(content: "chào buổi trưa",
  is_correct: false, word_id: 7)
Answer.create!(content: "chào buổi sáng",
  is_correct: false, word_id: 7)
Answer.create!(content: "rất mong được giúp đỡ",
  is_correct: false, word_id: 7)
Answer.create!(content: "chào buổi trưa",
  is_correct: true, word_id: 8)
Answer.create!(content: "tôi đã về",
  is_correct: false, word_id: 8)
Answer.create!(content: "chào buổi sáng",
  is_correct: false, word_id: 8)
Answer.create!(content: "chào buổi tối",
  is_correct: false, word_id: 8)
Answer.create!(content: "chào buổi tối",
  is_correct: true, word_id: 9)
Answer.create!(content: "chào buổi trưa",
  is_correct: false, word_id: 9)
Answer.create!(content: "chào buổi sáng",
  is_correct: false, word_id: 9)
Answer.create!(content: "tôi đã về",
  is_correct: false, word_id: 9)

puts "Create Result ....."

Result.create!(lesson_id: 1, word_id: 1, answer_id: 1)
Result.create!(lesson_id: 1, word_id: 2, answer_id: 5)
Result.create!(lesson_id: 1, word_id: 3, answer_id: 10)
Result.create!(lesson_id: 1, word_id: 4, answer_id: 12)
Result.create!(lesson_id: 1, word_id: 5, answer_id: 16)
