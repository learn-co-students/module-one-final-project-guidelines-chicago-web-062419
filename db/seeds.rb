require 'pry'
require 'json'

school_json = File.read("db/schools.json")
school_array = JSON.parse(school_json)

students_json = File.read("db/students.json")
students_array = JSON.parse(students_json)

teachers_json = File.read("db/teachers.json")
teachers_array = JSON.parse(teachers_json)

