require 'pry'
require 'json'

students_json = File.read("db/students.json")
students_array = JSON.parse(students_json)

teachers_json = File.read("db/teachers.json")
teachers_array = JSON.parse(teachers_json)

connections_json = File.read("db/connections.json")
connections_array = JSON.parse(connections_json)

students_array.each do |student|
    Student.create(first_name: student["first_name"], last_name: student["last_name"], gender: student["gender"], age: student["age"], grade: student["grade"], gpa: student["gpa"])
end

teachers_array.each do |teacher|
    Teacher.create(first_name: teacher["first_name"], last_name: teacher["last_name"], gender: teacher["gender"], age: teacher["age"])
end

connections_array.each do |connection|
    Connection.create(student_id: connection["student_id"], teacher_id: connection["teacher_id"])
end