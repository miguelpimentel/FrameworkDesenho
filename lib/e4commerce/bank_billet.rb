module E4commerce
    require "date"
    require "abstraction"

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

		def create_payment
            # Generates and returns bank billet given total price
            current_time = DateTime.now

            @boleto = Brcobranca::Boleto::BancoBrasil.new :cedente => "João João",
                :documento_cedente => "12345678912",
                :sacado => "Maria Maria",
                :sacado_documento => "12345678900",
                :valor => @total,
                :agencia => "4042",
                :conta_corrente => "61900",
                :convenio => "1238798",
                :numero_documento => "7777700168",
                :data_vencimento => current_time.strftime "%d/%m/%Y",
                :data_documento => current_time.next_month.strftime "%d/%m/%Y",
                :instrucao1 => "Pagável na rede bancária até a data de vencimento.",
                :instrucao2 => "Juros de mora de 2.0% mensal(R$ 0,09 ao dia)",
                :instrucao3 => "Após vencimento pagável somente nas agências do Banco do Brasil",
                :instrucao4 => "ACRESCER R$ 4,00 REFERENTE AO BOLETO BANCÁRIO",
                :sacado_endereco => "Gama, DF"

            send_data @boleto.to_pdf, :filename => "boleto.pdf"
		end

		def add_product(product)
			# Adds a product or an array of products to the products list
			@product_list << product
		end
	end

end