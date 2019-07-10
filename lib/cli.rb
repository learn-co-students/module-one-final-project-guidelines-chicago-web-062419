require 'pry'
require "tty-prompt"

# puts `clear`

def welcome
    
    puts "Welcome, hungry human!"
    prompt = TTY::Prompt.new
    user_input = prompt.select("What type of user are you?", %w(New Existing))

    # user_input = gets.chomp
    if user_input == "New"
        puts "Please create username"
        a = gets.chomp
        User.create(username: a)
        puts "Welcome #{a}, what would you like to do today?"
        puts options
            selection = gets.chomp
            if selection.to_i == 1
                puts search_recipes_by_ingredient
            elsif selection.to_i == 2
                puts search_recipes_by_calories
            elsif selection.to_i == 3
                puts view_favorites
            else
                puts ''
            end
    elsif user_input == "Existing"
        puts "Please enter username"
        name = gets.chomp
        puts "Welcome back, #{name}. What would you like to do today?"
        puts options
    else puts ''
    end
    # binding.pry
    # clear the screen for next method.
end

def search_recipes_by_ingredient
    puts "What ingredient would you like to search recipes for?"
    input = gets.chomp.capitalize
    search = Recipe.where("title like ?", "%#{input}%")
    search.title
    # binding.pry
end

def search_recipes_by_calories
    puts "Calorie counting? How many calories would you like your recipe to be within?"
    input = gets.chomp.to_f
    Recipe.search_by_calories(input)
end

def view_favorites

end

def options
    prompt = TTY::Prompt.new
    user_input = prompt.select("What type of user are you?", %w(New Existing))
    puts "1. Search recipes by keyword"
    puts "2. Search recipes by calories"
    puts "3. View favorited recipes"
end


