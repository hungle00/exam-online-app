# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: "admin@email.com", username: "iamadmin", password: "admin00", is_admin: true)
c = Category.create!(name: "Music")
e = Exam.create!(title: "Music symbols", category: c)
q = Question.create!(title: "What is mf stand for?", score: 10, exam: e)
Option.create!(content: "Mezzo forte", is_correct: true, question: q)
Option.create!(content: "Mezzo piano", question: q)