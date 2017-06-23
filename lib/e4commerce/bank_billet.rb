module E4commerce
    require "date"
    require "abstraction"
    require "brcobranca"

	class BankBillet < E4CPayment
        absrtact
		attr_accessor :product_list
		attr_accessor :total
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


		def calculate_total
            # Determine total price sum of products in list

            @product_list.each do |product|
                @total += product.unit_price
            end 

            return @total
		end

		def create_payment (bank)
            # Generates and returns bank billet given total price
            current_time = DateTime.now

            @boleto = @bank[bank] 
            @boleto.cedente = "Kivanio Barbosa"
            @boleto.documento_cedente = "12345678912"
            @boleto.sacado = "Claudio Pozzebom"
            @boleto.sacado_documento = "12345678900"
            @boleto.avalista = "Kivanio Barbosa"
            @boleto.avalista_documento = "12345678912"
            @boleto.valor = 11135.00
            @boleto.agencia = "4042"
            @boleto.conta_corrente = "61900"
            @boleto.variacao = "19"

            case banco
            when :itau
            # ITAU
            # O que diferencia um tipo de boleto de outro, dentro do itáu é o tipo de carteira utilizado.
            @boleto.convenio = "12345"
            when :bb
            # BB
            # O que diferencia um tipo de boleto de outro, dentro do Banco do Brasil é a quantidade de dígitos do convênio.
            @boleto.convenio = "1238798"
            when :hsbc
            # HSBC
            # O que diferencia um tipo de boleto de outro, dentro do HSBC é a quantidade de dígitos do número do documento.
            @boleto.numero_documento = "102008"
            when :caixa
            # CAIXA
            @boleto.convenio = "100000"
            when :sicredi
            @boleto.byte_idt = "2"
            @boleto.posto = "18"

            when :sicoob
            @boleto.convenio = "1238798"
            when :banestes
            @boleto.variacao = "2"
            else
            @boleto.convenio = "1238798"
            end

            @boleto.numero_documento = "111"
            @boleto.data_vencimento = "2008-02-01".to_date
            @boleto.data_documento = "2008-02-01".to_date
            @boleto.instrucao1 = "Pagável na rede bancária até a data de vencimento."
            @boleto.instrucao2 = "Juros de mora de 2.0% mensal(R$ 0,09 ao dia)"
            @boleto.instrucao3 = "DESCONTO DE R$ 29,50 APÓS 05/11/2006 ATÉ 15/11/2006"
            @boleto.instrucao4 = "NÃO RECEBER APÓS 15/11/2006"
            @boleto.instrucao5 = "Após vencimento pagável somente nas agências do Banco do Brasil"
            @boleto.instrucao6 = "ACRESCER R$ 4,00 REFERENTE AO BOLETO BANCÁRIO"
            @boleto.sacado_endereco = "Av. Rubéns de Mendonça, 157 - 78008-000 - Cuiabá/MT"

            formato=params[:boleto][:formato].to_sym
            headers['Content-Type']=FORMATOS_SUPORTADOS[formato]
            send_data @boleto.to(formato), :filename => "boleto_#{banco}.#{formato}"

		end

		def add_product(product)
			# Adds a product or an array of products to the products list
			@product_list << product
		end
	end

end