class BradescoBillet < BankBillet
	def create_payment(client)
	 	#Generates and returns bank billet given total price
            current_time = DateTime.now

            @boleto = Brcobranca::Boleto::Bradesco.new :cedente => client.cedente,
                  :documento_cedente => client.documento_cedente,
                  :sacado => client.sacado,
                  :sacado_documento => client.sacado_documento,
                  :valor => self.calculate_total,
                  :agencia => client.agencia,
                  :conta_corrente => client.conta_corrente,
                  :convenio => client.convenio,
                  :numero_documento => client.numero_documento,
                  :data_vencimento => client.data_vencimento,
                  :data_documento => client.data_documento,
                  :instrucao1 => client.instrucao1,
                  :instrucao2 => client.instrucao2,
                  :instrucao3 => client.instrucao3,
                  :sacado_endereco => client.sacado_endereco

            send_data @boleto.to_pdf, :filename => "boletoBradesco.pdf"
      end
end