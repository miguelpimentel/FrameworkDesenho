module E4commerce
    
    require "date"
    require "abstraction"
    require "client"
    require "brcobranca"

	class BankBillet < E4CPayment

		def calculate_total(product_list)
            # Determine total price sum of products in list

            self.product_list.each do |product|
                self.total += product.unit_price
            end 

            return self.total
		end

		def create_payment(client)
            
            raise NotImplementedError, "Child must implement method"
        end

		def add_product(product)
			# Adds a product or an array of products to the products list
			self.product_list << product
		end
	end

end