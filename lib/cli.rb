require 'pry'
require "tty-prompt"

# puts `clear`

NEW_LINE = "\n"

def welcome
    
    puts "Welcome, hungry human!"
    prompt = TTY::Prompt.new
    user_input = prompt.select("What type of user are you?", %w(New Existing))
    if user_input == "New"
        puts "Please create username"
        a = gets.chomp
        new_user = User.create(:username => a)
        puts "Welcome #{a}"
        puts options(new_user)
        # binding.pry
    elsif user_input == "Existing"
        puts "Please enter username"
        name = gets.chomp
        puts "Welcome back, #{name}."
        puts options(new_user)
        else puts ''
    end
end
    
# def search_recipes_by_calories
#     puts "Calorie counting? How many calories would you like your recipe to be within?"
#     input = gets.chomp.to_f
#     Recipe.search_by_calories(input)
# end

def options(new_user)
    puts "HOME"
    prompt = TTY::Prompt.new
    # user_input = prompt.select("What would you like to do today?", %w(Search recipes by keyword "Search recipes by calories", "View favorited search_recipes_by_ingredient"))
    user = prompt.select("What would you like to do today?") do |menu|
        menu.choice 'Search recipe by keyword'
        menu.choice 'Search recipe by calories'
        menu.choice 'View favorites'
        end
        if  user == "Search recipe by keyword"
            puts "What ingredient would you like to search recipes for? (Please enter number)"
            input = gets.chomp.capitalize
            search = Recipe.where("title like ?", "%#{input}%") #returns all Chicken recipes
            array = []
            search.each.with_index(1) do |s,i|
                array << "#{i} #{s.title}"
                ######put TTY prompt###############
                # prompt = TTY::Prompt.new
                # prompt.select("Select an editor?", s.title)
            end
            puts array
            selected_num = gets.chomp.to_i
                if selected_num == 1
                    x = Recipe.find(selected_num)
                    puts chicken_select(x, new_user)
                elsif selected_num == 2
                    x =  Recipe.find(selected_num)
                    puts chicken_select(x, new_user)
                elsif selected_num == 3
                    x = Recipe.find(selected_num)
                    puts chicken_select(x, new_user)
                elsif selected_num == 4
                    x =  Recipe.find(selected_num)
                    puts chicken_select(x, new_user)
                elsif selected_num == 5
                    x =  Recipe.find(selected_num)
                    puts chicken_select(x, new_user)
                end
        elsif user == "Search recipe by calories"
            puts "How many calories would you like your meal to be within?"
            calories = gets.chomp.to_f
            search = Recipe.where("calories < ?", calories)
            search.collect do |s|
                puts s.title
            end
        elsif user == "View favorites"
            # binding.pry
            # search = Favorite.find_by (user_id: new_user.id)
            # puts search
            # puts NEW_LINE
            #User can then enter each of these recipes  = If recipe has been selected, can un-favorite, or go back to homepage
        else
            puts ''
        end
        # binding.pry
end



def chicken_select(x, new_user)
    puts `clear`
    puts "Title - \n #{x.title}"
    puts "Ingredients - \n #{x.ingredients}"
    puts "Directions - \n #{x.directions}"
    puts "Calories - \n #{x.calories}"
    puts "\n"
    ################################ADD TTY PROMPT##########################################
    puts "1. Add to Favorites"
    puts "2. Return to Home"
    input = gets.chomp.to_i
    if input == 1
        puts create_favorite(new_user, x)
        puts "Added #{x.title} to Favorites!"
        puts options(new_user)
    elsif input == 2
        puts options
    else puts "Bok bok, try again :("
        ########################ADD ASSCI of DEAD CHICKEN#####################################
    end
end



def create_favorite(new_user, recipe)
    new_fave = Favorite.new
    new_fave.user_id = new_user.id
    new_fave.recipe_id = recipe.id
    new_fave
end


