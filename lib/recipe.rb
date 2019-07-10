class Recipe < ActiveRecord::Base
    has_many :favorites
    has_many :users, through: :favorites

    #User can search all recipes using keyword
    def self.search_by_ingredient(argument)
        search = Recipe.where("title like ?", "%#{argument}%")
        search
    end

#User can search by max calories
    def self.search_by_calories(calories)
        Recipe.where("calories < ?", calories)
    end
#Recipe can see how many times their recipe has been favorited
    def favorites_count
       faves =  Favorite.where(recipe_id: self.id)
       faves.count
    end

end

