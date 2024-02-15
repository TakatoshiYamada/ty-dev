# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# ユーザーとサイトを作成
user = User.create(email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true, name: 'admin')
site = user.create_site(user_id: 1, name: 'Takatoshi Yamada Arcives', description: 'This is my Site')

site.top_image.attach(io: File.open(Rails.root.join("public/images/top_image.jpg")), filename: "top_image.jpg")
