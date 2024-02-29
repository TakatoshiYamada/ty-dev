# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# ユーザーを作成
## emailが存在しない場合のみ作成
user = User.find_or_create_by!(email: 'admin@example.com') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
  user.admin = true
  user.name = 'admin'
  user.biography = 'This is Admin'
end

# サイトが存在しない場合のみ作成、存在する場合は更新
site = user.site || user.build_site(name: 'Takatoshi Yamada Archives', description: 'This is my Site')
site.save!

# トップ画像をアタッチ
site.top_image.attach(
  io: File.open(Rails.root.join("public/images/top_image.jpg")),
  filename: "top_image.jpg"
  )
