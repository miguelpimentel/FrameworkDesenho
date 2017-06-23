module E4commerce
    require "date"
    require "abstraction"
    require "client"
	class BankBillet < E4CPayment
        absrtact
		attr_accessor :product_list
		attr_accessor :total

		def calculate_total
            # Determine total price sum of products in list

            @product_list.each do |product|
                @total += product.unit_price
            end 

            return @total
		end

		def create_payment(client)
            
            raise NotImplementedError, "Child must implement method"
        end

		def add_product(product)
			# Adds a product or an array of products to the products list
			@product_list << product
		end
	end

end