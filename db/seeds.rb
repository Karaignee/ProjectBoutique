# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Designer, Category, Name, Description, Price
#Product.create( :image => '#', :designer => 'Mine', :category => 'dress', :name => 'Teardrop Maxi', :description => 'velvet cut out maxi dress in navy', :price =>'100')
#Product.create( :image => '#', :designer => 'Mine', :category => 'top', :name => 'Teardrop Top', :description => 'velvet cut out top with lave shoulder detail',:price =>'60')
#Product.create( :image => '#', :designer => 'Electronic Sheep', :category => 'Knitwear', :name => 'Dolly', :description => 'Pure lambswool cardigan in cream', :price =>'100')
#Product.create( :image => '#', :designer => 'Electronic Sheep', :category => 'Knitwear', :name => 'Sonny', :description => 'Pure lambswool stripey sweater ', :price =>'100')


User.create(:email => "test@test.com", :hashed_password => "75ada95d871dcca86237fcab94575a31d1b359cf",  :level => 1)