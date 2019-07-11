
def welcome
    puts "Welcome to local school database, Administrator."
    puts "Please choose an option"
    puts <<-list
        1. View all teachers
        2. View students by grade
        3. Search for teacher
        4. Search for student
        5. Add student
        6. Add teacher
        7. School statistics
        8. Exit
    list

    input = gets.chomp.to_i
    
    case input
    when 1
        puts Teacher.teacher_list_sorted
    when 2
        
    when 3

    when 4

    when 5

    when 6
    else
        "Please enter a valid number."
    end
end

