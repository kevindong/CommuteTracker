User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
users.each do |user|
  10.times do
    starttime = Time.at(Faker::Base::rand_in_range(30.days.ago.to_f, Time.now.to_f))
    endtime = starttime + Faker::Base::rand_in_range(5.minutes.to_f, 60.minutes.to_f)
    user.commutes.create!(starttime: starttime, endtime: endtime)
  end
end