class CreateRecipes < ActiveRecord::Migration
    def change
        create_table :recipes do |t|
        t.string :title
        t.string :ingredients
        t.string :directions
        t.float :calories
        end 
    end    
end

