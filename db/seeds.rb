10.times do
Article.create([{
  title: Faker::Science.element,
  text: Faker::Science.scientist,
  category_id: rand(1..4)
  }])
end
