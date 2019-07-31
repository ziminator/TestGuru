# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create([
  { category: 'Front-end' },
  { category: 'Back-end' },
  { category: 'Full-stack' }
])

users = User.create([
  { first_name: 'Alex', email: 'alex@example.com', password: 'password' },
  { first_name: 'July', email: 'july@example.com', password: 'password' },
  { first_name: 'Alisa', email: 'alisa@example.com', password: 'password' },
  { first_name: 'Lara', email: 'lara@example.com', password: 'password' }
])

admins = Admin.create([
  { first_name: 'Alexandr', last_name: 'Zimin', email: 'aleksander.zimin@gmail.com', password: 'P@ssw0rd', type: 'Admin' }
])

tests = Test.create([
  { title: 'Ruby', level: 1, category_id: categories.fetch(0).id, user_id: admins.fetch(0).id },
  { title: 'Ruby', level: 1, category_id: categories.fetch(1).id, user_id: admins.fetch(0).id },
  { title: 'Ruby on Rails', level: 1, category_id: categories.fetch(1).id, user_id: admins.fetch(0).id },
  { title: 'Ruby on Rails', level: 2, category_id: categories.fetch(2).id, user_id: admins.fetch(0).id },
  { title: 'HTML', level: 1, category_id: categories.fetch(0).id, user_id: admins.fetch(0).id }
])

questions = Question.create([
  { question: "'Ruby' компилируемый или интерпретируемый язык?", test_id: tests.fetch(0).id },
  { question: "Как называется базовый класс в 'Ruby'?", test_id: tests.fetch(1).id },
  { question: "Что такое 'Rails'?", test_id: tests.fetch(2).id },
  { question: "Что такое 'HTML'?", test_id: tests.fetch(3).id }
])

answers = Answer.create([
  { answer: "'Ruby' это интерпретируемый язык программирования.", correct: true, question: questions[0] },
  { answer: "'Ruby' это компилируемый язык программирования.", correct: false, question: questions[0] },
  { answer: "'BasicObject'.", correct: true, question: questions[1] },
  { answer: "'Object'.", correct: false, question: questions[1] },
  { answer: "'Rails' это фреймворк.", correct: true, question: questions[2] },
  { answer: "'Rails' это облачный сервис.", correct: false, question: questions[2] },
  { answer: "'HTML' это стандартный язык разметки для создания веб-страниц и веб-приложений.", correct: true, question: questions[3] },
  { answer: "'HTML' это объектно-ориентированный язык.", correct: false, question_id: questions[3] }
])
