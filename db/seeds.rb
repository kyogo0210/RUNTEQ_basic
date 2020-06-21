User.create!(first_name:  "キョウゴ",
              last_name: "ヤマダ",
             email: "yamada@mail.com",
             password:              "123456",
             password_confirmation: "123456")

9.times do |n|
  User.create!(first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: Faker::Internet.email,
                password:              "123456",
                password_confirmation: "123456"
                )
end

10.times do |n|
  Board.create!(title: Faker::Coffee.blend_name,
                body: Faker::Coffee.notes,
                user_id: rand(1..10)
                )
end