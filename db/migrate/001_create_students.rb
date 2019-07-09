class CreateStudents < ActiveRecord::Migration[5.0]
    def change
        create_table :students do |t|
            t.string :first_name
            t.string :last_name
            t.string :gender
            t.integer :age
            t.integer :grade
            t.float :gpa
        end
    end
end