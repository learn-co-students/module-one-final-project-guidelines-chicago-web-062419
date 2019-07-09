class User < ActiveRecord::Base
    has_many :favorites
    has_many :recipes, through: :favorites
end

puts "user.rb file is connected"