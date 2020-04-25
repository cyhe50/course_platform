# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(username: 'myuser', passward: 'mypassward')
User.create(username: 'test2', passward: 'testtest')

Course.create(subject: 'math', price: 123, currency: 'NTD', course_type: 'calculus', published: 0, url: '/', intro: 'An calculus course', exp_time: 30)
Course.create(subject: 'backend', price: 111, currency: 'USD', course_type: 'RoR', published: 1, url: '/', intro: 'An RoR course', exp_time: 1)
Course.create(subject: 'computer', price: 100, currency: 'USD', course_type: 'database', published: 1, url: '/', intro: 'An database course', exp_time: 5)
