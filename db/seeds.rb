# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: "admin@email.com", username: "iamadmin", password: "admin00", is_admin: true)
c = Category.create!(name: "Music")
e = Exam.create!(title: "Music symbols", category: c, time: 1)
q = Question.create!(title: "What is mf stand for?", score: 10, exam: e)
Option.create!(content: "Mezzo forte", is_correct: true, question: q)
Option.create!(content: "Mezzo piano", question: q)
Question.create!(title: "What is sonata form?", score: 20, exam: e)

ActiveRecord::Base.transaction do
  c = Category.create!(name: 'Literature')
  e = Exam.create!(title: 'J.R.R.Tolkien', category: c, time: 3)
  12.times do 
    q = Question.create!(title: Faker::Fantasy::Tolkien.poem, score: rand(10..15), exam: e)
    2.times do 
      Option.create!(content: Faker::Fantasy::Tolkien.character, question: q, is_correct: [true, false].sample)
    end
  end
end
