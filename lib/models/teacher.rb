class Teacher < ActiveRecord::Base
    has_many :connections
    has_many :students, through: :connections

    def self.most_students
        higheststudents = 0
        highestteacher = nil
        Teacher.all.each do |teacher|
            if teacher.students.count > higheststudents
                higheststudents = teacher.students.count
                highestteacher = teacher
            end
        end
        "#{highestteacher.teacher_name} has the largest class with #{higheststudents} students!"
    end

    def full_name
        "#{first_name} #{last_name}"
    end

    def teacher_name
        if self.gender == "Male"
            "Mr. #{last_name}"
        else
            "Mrs. #{last_name}"
        end
    end

    def average_gpa_per_teacher
        class_gpas = self.students.collect do |student|
            student.gpa
        end
        avg_gpa = (class_gpas.sum / class_gpas.size)
        avg_gpa.round(2)
    end

    def view_class_list
        list = self.students.collect do |student|
            "#{student.first_name} #{student.last_name}"
        end
    end

    def self.oldest_teacher
        maxage = Teacher.maximum(:age)
        eldest = Teacher.find_by age: maxage
        "#{eldest.teacher_name} is #{maxage}!!!"
    end

    def self.highest_avg_gpa
        highest_gpa = 0
        highestteacher = nil
        Teacher.all.each do |teacher|
            if teacher.average_gpa_per_teacher > highest_gpa
                highest_gpa = teacher.average_gpa_per_teacher
                highestteacher = teacher.teacher_name
            end
        end
        "#{highestteacher} has the highest average student gpa of: #{highest_gpa}"
    end

    def self.teacher_stats(teacher_last_name)
        teacher_inst = Teacher.find_by last_name: teacher_last_name
        puts "#{teacher_inst.teacher_name}"
        puts "#{teacher_inst.age}"
        puts "#{teacher_inst.average_gpa_per_teacher}"
        puts "#{teacher_inst.view_class_list.count}"
    end

    def self.teacher_list_sorted
        sorted_teachers = Teacher.all.sort_by{|teacher| teacher.last_name}
        sorted_teachers.map do |teacher|
            teacher.full_name
        end

    end
    #part of ActiveRecord
    # def self.total_teachers
    #     Teacher.count
    # end
end