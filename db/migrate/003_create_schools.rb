class CreateSchools < ActiveRecord::Migration[5.0]
    def change
        create_table :schools do |t|
            t.string :name
            t.string :location
            t.string :date_erected
        end
    end
end