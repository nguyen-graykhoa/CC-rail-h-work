# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Comment.destroy_all
Post.destroy_all
User.destroy_all

PASSWORD = "123"

super_user = User.create(
    first_name: "Admin",
    last_name: "User",
    email: "admin@user.com",
    password: PASSWORD,
    is_admin: true
)

i = 0
5.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    i = i + 1
    User.create(
        first_name: first_name,
        last_name: last_name,
        email: "#{first_name}.#{last_name}#{i}@mail.com",
        password: PASSWORD,
        is_admin: false
    )
end

users = User.all

50.times do
  created_at = Faker::Date.backward(days:365 * 5)

  p = Post.create(
     title: Faker::Hacker.say_something_smart,
     body: Faker::ChuckNorris.fact,
     created_at: created_at,
     updated_at: created_at,
     user: users.sample
  )
  if p.valid?
    rand(1..5).times do
      Comment.create(body: Faker::Hacker.say_something_smart, post: p, user: users.sample)
    end
  end    

end