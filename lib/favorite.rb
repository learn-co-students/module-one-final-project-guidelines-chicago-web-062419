class Favorite < ActiveRecord::Base
    belongs_to :user
    belongs_to :recipe

    def create_favorite
        Favorite.create(:user_id, :recipe_id)
    end
end