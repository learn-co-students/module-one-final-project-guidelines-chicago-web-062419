class Recipe < ActiveRecord::Base
    has_many :favorites
    has_many :users, through: :favorites

    #User can search all recipes using keyword
    # Needs to come back with recipe.title.
    def self.search_by_ingredient(argument)
        search = Recipe.where("title like ?", "%#{argument}%")
        search #Wondering if we need the result to have numbers or index for user to select option. 
        # gets.chomp for selection.
        # show entire recipe.
            # puts recipe.title
            # puts recipe.ingredients
            # puts recipe.directions
            # puts recipe.calories
        # Add to favorites?
        # Back to search by prompt.
    end

#User can search by max calories
    def self.search_by_calories(calories)
        Recipe.title.where("calories < ?", calories)
        # How do we show just the recipe.title that matches?
        # show entire recipe.
            # puts recipe.title
            # puts recipe.ingredients
            # puts recipe.directions
            # puts recipe.calories
        # Add to favorites?
        # Back to search by prompt. 
    end


    #Recipe can see how many times their recipe has been favorited
    def favorites_count
       faves = Favorite.where(recipe_id: self.id)
       faves.count
    end

end

