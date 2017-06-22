require "abstraction"
require "active_record"

#class E4CPayment < ActiveRecord::Base ~> Rails project, need database
class E4CPayment
	abstract

	attr_accessor :product_list
	attr_accessor :total

	def calculate_total(products)
		raise NotImplementedError, "Child must implement method"
	end

	def create_payment
		raise NotImplementedError, "Child must implement method"
	end

	def add_product(product)
		raise NotImplementedError, "Child must implement method"
	end

end