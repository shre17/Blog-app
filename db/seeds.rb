# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([{
  email: "chaau@gmail.com",
  password: "1234567890",
  role: "admin"
  },
 # {
 #  email: "niki@gmail.com",
 #  password: "123456",
 #  role: "user"
 # },
 {
  email: "kai@gmail.com",
  password: "123456",
  role: "author"
 }
  ])

# user = User.where(role: 'author').first

# Article.all.map{|a| a.update_attributes(user_id: user)}