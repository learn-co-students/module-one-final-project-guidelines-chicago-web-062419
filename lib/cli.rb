def welcome
    prompt = TTY::Prompt.new
    # prompt.ask('Welcome, hungry human')
    prompt.yes?('Do you like Ruby?')
    # puts "Welcome, hungry human!"
    puts "1. New User?"
    puts "2. Existing User?"
    puts
    user_input = gets.chomp

    if user_input == 1
        create_user_name
    elsif user_input == 2
        greet_existing_user
    end

    # clear the screen for next method.
end


