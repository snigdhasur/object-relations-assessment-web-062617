class Customer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @@all << self 
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
  	@@all 
  end 
  
  def self.find_by_name(full_name)
    self.all.detect {|customer| customer.full_name == full_name}
  end 

  def self.find_all_by_first_name(first_name)
  	self.all.select {|customer| customer.first_name == first_name}
  end 

  def self.all_names 
  	self.all.map do |customer|
  		customer.full_name 
  	end 
  end 

  def add_review(restaurant, content) 
  	Review.new(self, restaurant, content)
  end 

  def reviews 
  	Review.all.select do |review|
  		review.customer == self 
  	end 
  end 

   def restaurants_reviewed 
  	self.reviews.map do |review|
  		review.restaurant 
  	end.uniq  
  end 


end
