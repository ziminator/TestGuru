# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Answer.create(answer: 'Правильно', correct: true)
Category.create(category: 'Первая категория')
Question.create(question: 'Какой из языков является языком гипертекстовой разметки?')
Test.create(title: 'HTML - язык гипертекстовой разметки', level: 1)
User.create(user: 'Alex')
