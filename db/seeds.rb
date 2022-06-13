# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Teacher.destroy_all
Student.destroy_all

vidhi = Teacher.create(name: 'Vidhi')
raul = Teacher.create(name: 'Raul')
david = Teacher.create(name: 'David')

Student.create(
  name: 'Caleb',
  age: 25,
  major: 'Computer Science',
  teacher_id: david.id,
)
Student.create(name: 'Gian', age: 22, major: 'Mathmatics', teacher_id: raul.id)
Student.create(
  name: 'Anam',
  age: 25,
  major: 'Engineering',
  teacher_id: vidhi.id,
)
Student.create(name: 'Vien', age: 23, major: 'Biology', teacher_id: raul.id)
