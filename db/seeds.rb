10.times do
Article.create([{
  title: Faker::Science.element,
  text: Faker::FunnyName.four_word_name,
  category_id: rand(1..4)
  }])
end

40.times do
  Subscriber.create([{
    f_name: Faker::Name.first_name,
    l_name: Faker::Name.last_name,
    country: Faker::Address.country,
    email: Faker::Internet.email
    }])
end
