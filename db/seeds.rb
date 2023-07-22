10.times do
  user = User.create!(email: Faker::Internet.email, password: 'qwer4321', password_confirmation: "qwer4321")
  puts "create user id: #{user.id}, email: #{user.email}"
end

30.times do |i|
  puts "start create #{i} post"
  region = Address::Region.all.sample
  post = Post.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, user: User.all.sample, region: region, province: Address::Province.all.sample, city: Address::City.all.sample, barangay: Address::Barangay.all.sample)
  (1..20).to_a.sample.times do
    Comment.create(content: Faker::Lorem.sentence, user: User.all.sample, post: post)
  end
  puts "finish #{i} post"
end