puts "Create admin ....."

User.create!(name: "Admin",
  email: "admin@framgia.com",
  password: "12345678",
  password_confirmation: "12345678",
  is_admin: true)
