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
        puts `clear`
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
    

def options(new_user)
    puts "HOME"
    prompt = TTY::Prompt.new
    # user_input = prompt.select("What would you like to do today?", %w(Search recipes by keyword "Search recipes by calories", "View favorited search_recipes_by_ingredient"))
    user = prompt.select("What would you like to do today?") do |menu|
        menu.choice 'Search recipe by keyword'
        menu.choice 'Search recipe by calories'
        menu.choice 'View favorites'
        end
        puts `clear`
        if  user == "Search recipe by keyword"
            puts "What ingredient would you like to search recipes for?"
            input = gets.chomp.capitalize
            search = Recipe.where("title like ?", "%#{input}%") #returns all Chicken recipes
            array = []
            search.each.with_index(1) do |s,i|
                array << "#{i} #{s.title}"
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
            array = []
            search.each.with_index(1) do |s,i|
                array << "#{i} #{s.title}"
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
        elsif user == "View favorites"
            puts "My Favorites"
            if view_favorites(new_user).empty? 
                puts "You have no favorite recipes :("
            else
                puts view_favorites(new_user)
                prompt = TTY::Prompt.new
            # user_input = prompt.select("What would you like to do today?", %w(Search recipes by keyword "Search recipes by calories", "View favorited search_recipes_by_ingredient"))
                userprompt = prompt.select("Menu") do |menu|
                    menu.choice 'Delete_Favorite'
                    menu.choice 'Return_Home'
                    end
                if userprompt == "Return_Home"
                        puts options(new_user)
                elsif userprompt == "Delete_Favorite"
                    puts `clear`
                    puts delete_title(new_user)
                    puts "\n"
                    puts "Return Home (y/n)"
                        input = gets.chomp
                        if input == "y"
                            puts options(new_user)
                        elsif input == "n"
                            puts "Seeya Later!"
                        else ""
                        end
                else
                     puts ''
                end
             end
        # binding.pry
        end
end



def chicken_select(x, new_user)
    puts `clear`
    puts "Title - \n #{x.title}"
    puts "Ingredients - \n #{x.ingredients}"
    puts "Directions - \n #{x.directions}"
    puts "Calories - \n #{x.calories}"
    puts "\n"
    ################################ADD TTY PROMPT##########################################
    puts "1. ♥ Add to Favorites"
    puts "2. ⌂ Return to Home"
    input = gets.chomp.to_i
    if input == 1
        create_favorite(new_user, x)
        puts "Added #{x.title} to Favorites!"
        puts `clear`
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
    new_fave.save
end

def view_favorites(new_user)
    get_my_faves = Favorite.where(user_id: new_user.id)
    new_array = []
    get_my_faves.each do |fave|
        new_array << fave.recipe.id
    end 
    
    favorites = new_array.map do |id|
        find_recipe_title(id)
    end

    array = []
    favorites.each.with_index(1) do |s,i|
        array << "#{i} #{s}"
    end            
    
end

def find_recipe_title(id)
    a = Recipe.find(id)
    a.title
end

def delete_title(new_user)
#get the recipe ids in my user favorites
    get_my_faves = Favorite.where(user_id: new_user.id)
    new_array = []
    get_my_faves.each do |fave|
        new_array << fave.recipe.id
    end 
#get the title of these recipes  
    fav_titles = []
    new_array.map do |id|
        fav_titles << find_recipe_title(id)
    end
      
    prompt = TTY::Prompt.new
    answer = prompt.select("Which Recipe Would You Like To Delete?", fav_titles)  
        fav_titles.each do |x| #title return
            if answer == x 
                a = Recipe.find_by(title: x)
                b = a.id
                c = Favorite.where(recipe_id: b, user_id: new_user.id).destroy_all
            else ""
            end
        end
    puts "You have deleted #{answer} from your favourites"
    # binding.pry

end
                
