User.destroy_all

def avatar
  ['girl', 'boy'].sample + '-' + (rand(22) + 1).to_s + '.png'
end

natalie = User.create!(
  first_name: 'Natalie',
  last_name:  "O'Brien",
  username:  'natalie',
  email:      'natalie@objo.com',
  avatar:     'girl-10.png',
  password:   '12345678',
  password_confirmation:  '12345678'
)

10.times do
  u = User.create!(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    username:  Faker::Internet.user_name,
    email:      Faker::Internet.email,
    avatar:     avatar,
    password:   '12345678',
    password_confirmation:  '12345678'
  )

  natalie.follow(u)
end
