module E4commerce
    require "date"
    require "abstraction"
    require "client"
    require "brcobranca"
	class BankBillet < E4CPayment
        attr_accessor :bank

        def initialize(bank)
        
            @bank = [ :itau => Brcobranca::Boleto::BancoItau.new,
                      :bb => Brcobranca::Boleto:BancoBrasil.new
                      :hsbc => Brcobranca::Boleto::Hsbc.new,
                      :santander => Brcobranca::Boleto::Santander.new,
                      :bradesco => Brcobranca::Boleto::Bradesco.new,
                      :caixa => Brcobranca::Boleto::Caixa.new
                      :sicredi => Brcobranca::Boleto::Sicredi.new,
                      :sicoob => Brcobranca::Boleto::Sicoob.new,
                      :banestes => Brcobranca::Boleto::Banestes.new
                      
                      
                    ]
        
        end

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