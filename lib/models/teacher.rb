class Teacher < ActiveRecord::Base
    has_many :connections
    has_many :students, through: :connections
end