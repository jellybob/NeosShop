# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# puts '.. Deleting Items'
Item.delete_all

# puts '.. Creating Items'
Item.create! id: 1, name: 'Smart Hub', 		     price: 49.99
Item.create! id: 2, name: 'Motion Sensor', 	   price: 24.99
Item.create! id: 3, name: 'Wireless Camera', 	 price: 99.99
Item.create! id: 4, name: 'Smoke Sensor', 		 price: 19.99
Item.create! id: 5, name: 'Water Leak Sensor', price: 14.99


# puts '.. Deleting User'
User.delete_all

# puts '.. Creating User'
User.create! id: 1, email: 'user1@neos.com', password: 'password', password_confirmation: 'password'


# puts '.. Deleting Promotions'
Promotion.delete_all

# puts '.. Create Promotions'
Promotion.create! id: 1, code: 20.00, promo_type: 'PERCENT', standalone: true
Promotion.create! id: 2, code: 5.00,  promo_type: 'PERCENT', standalone: false
Promotion.create! id: 3, code: 20.00, promo_type: 'AMOUNT',  standalone: false