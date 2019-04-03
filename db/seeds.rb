test_user = User.find_by(email: 'testmike@example.com')
unless test_user.present?
  User.create(email: 'testmike@example.com', password: 'Password8')
end

3.times do
  user = User.create!(email: Faker::Internet.email, password: SecureRandom.hex(10))
  puts "user created. id: #{user.id}"
end

100.times do |i|
  body = "#{Faker::TvShows::Seinfeld.quote}\n\n#{Faker::Markdown.random}"
  til_log = TilLog.create(title: i.even? ? Faker::ChuckNorris.fact : Faker::TvShows::DumbAndDumber.quote,
                          body: body,
                          user: i < 30 ? User.first : User.all.sample,
                          public: [true, false].sample,
                          tag_list: i.even? ? ['chuck'] : ['dumb'])
  puts "til_log created: #{til_log.id}"
end
