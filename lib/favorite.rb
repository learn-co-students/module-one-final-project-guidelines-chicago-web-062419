class Favorite < ActiveRecord::Base
    belongs_to :user
    belongs_to :recipe

    #work in progress =  how to add to favorites
    # def create_favorite
    #     Favorite.create
    # end
end