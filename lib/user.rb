class User < ActiveRecord::Base
    has_many :favorites
    has_many :recipes, through: :favorites

    # csv_data = 
    # "1,mdrable0,Martin,Drable,PgYkJucV
    # 2,rgilhooley1,Roanne,Gilhooley,x5mjEZ
    # 3,krudolph2,Kipp,Rudolph,7Zn4U34jUVe1
    # 4,nounsworth3,Nanine,Ounsworth,WdYSros
    # 5,ahollyer4,Alden,Hollyer,7nyfwP"
    
    # rows = csv_data.split(“\n”)
    # users = rows.collect do |row|
    #     data = row.split(“,“)
    #     id = data[0]
    #     username = data[1]
    #     first_name = data[2]
    #     last_name = data[3]
    #     password = data[4]

    # user = User.new
    #     user.id = id
    #     user.username = username
    #     user.first_name = first_name
    #     user.last_name = last_name
    #     user.password = password
    # user
    # end
    
    # users
end



puts "Hello, it's working."

puts users = User.all.map(&:username)