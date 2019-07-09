class CreateConnection < ActiveRecord::Migration[5.0]
    def change
        create_table :connections do |t|
            t.integer :student_id
            t.integer :teacher_id
        end
    end
end