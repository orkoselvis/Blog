5.times do 
  Category.create([{
  name: ["Movies", "Sport", "Nature", "Action", "Hobbies"].sample
  desc: "This is about it"
  }])
end

10.times do
  Article.create([{
  title: Faker::Science.element,
  text: Faker::Science.scientist,
  category_id: rand(1..5)
  }])
end


