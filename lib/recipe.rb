class Recipe < ActiveRecord::Base
    has_many :favorites
    has_many :users, through: :favorites

    #User can search all recipes using keyword
    def self.search_by_ingredient(argument)
        Recipe.where("title LIKE ?", argument).all
    end

#User can search by max calories
    def self.search_by_calories(calories)
        Recipe.where("calories < ?", calories.to_f)
    end

    def favorites_count
       faves =  Favourites.where(recipe_id: self.id)
       faves.count
    end

end

