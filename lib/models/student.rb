class Student < ActiveRecord::Base
    has_many :connections
    has_many :teachers, through: :connections

end