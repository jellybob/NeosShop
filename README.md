# README

* Ruby version
  * ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-darwin15]
  
* Rails version
  * Rails 5.1.4

* Database creation
  * SQLite
  
* Database initialization
  * rake db:migrate && rake db:seed

* How to run the test suite
  * bundle exec rspec
  
* Run server
  * rails s
  
  
# Database:
  * has_many :through association between models. 
    * Between Order and Item, Order and Promotion.
  
  * accepts_nested_attributes for-
    * Card and Checkout
    
  
# Caveats:
  * Maintains only session_id, so if browser is closed session is lost. 
    * To fix this cookies needs to be maintained.
    
  * Business logics are held on models.
    * Some logics can be moved to a service class.
    
  * Custom Errors needs moving to its own concerns.
    
  * Better OrderStatus, ssl, 
  
  * Dockerise.
  
  * Better Query to avoid unnecessary query calls.
  
  * More test coverage needed.
 
  
  
