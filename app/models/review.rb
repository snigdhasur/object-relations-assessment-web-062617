class Review
  
	attr_accessor :customer, :restaurant, :content 

	@@all = []

	def initialize(customer, restaurant, content)
		@customer = customer
		@restaurant = restaurant
		@content = content
		@@all << self 
	end 

	def self.all
		@@all 
	end 

	def self.customers 
		self.all.map do |review|
			review.customer 
		end.uniq
	end 

	def self.restaurants
		self.all.map do |review|
			review.restaurant 
		end.uniq 
	end 

end

