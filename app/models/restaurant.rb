class Restaurant
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self 
  end

  def self.all
  	@@all 
  end 

  def self.find_by_name(name)
  	self.all.detect {|restaurant| restaurant.name == name}
  end 

  def reviews 
  	Review.all.select do |review|
  		review.restaurant == self 
  	end 
  end 

	def customers 
	 	self.reviews.map do |review|
	 		review.customer
	 	end.uniq 
	 end 


end
