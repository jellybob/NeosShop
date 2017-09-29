# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p 'Seeding Database' if Rails.env == 'development'

p 'Seeding Item' if Rails.env == 'development'
Item.delete_all
Item.create! id: 1, name: 'Smart Hub', 		     price: 49.99
Item.create! id: 2, name: 'Motion Sensor', 	   price: 24.99
Item.create! id: 3, name: 'Wireless Camera', 	 price: 99.99
Item.create! id: 4, name: 'Smoke Sensor', 		 price: 19.99
Item.create! id: 5, name: 'Water Leak Sensor', price: 14.99

p 'Seeding User' if Rails.env == 'development'
User.delete_all
User.create! id: 1, email: 'user1@neos.com', password: 'password', password_confirmation: 'password'

p 'Seeding Promotion' if Rails.env == 'development'
Promotion.delete_all
Promotion.create! id: 1, code: 20.00, promo_type: 'PERCENT', standalone: true
Promotion.create! id: 2, code: 5.00,  promo_type: 'PERCENT', standalone: false
Promotion.create! id: 3, code: 20.00, promo_type: 'AMOUNT',  standalone: false