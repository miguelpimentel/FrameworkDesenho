module E4commerce
	class Client

		attr_accessor :cedente
		attr_accessor :documento_cedente
		attr_accessor :sacado
		attr_accessor :sacado_documento
		attr_accessor :agencia
		attr_accessor :conta_corrente
		attr_accessor :convenio
		attr_accessor :numero_documento
		attr_accessor :data_vencimento
		attr_accessor :data_documento
		attr_accessor :instrucao1
		attr_accessor :instrucao2
		attr_accessor :instrucao3
		attr_accessor :sacado_endereco

		def initialize(cedent, documento_cedente, sacado, sacado_documento, agencia, conta_corrente,
			convenio, numero_documento, data_vencimento, data_documento, instrucao1,instrucao2,instrucao3,
			instrucao4, sacado_endereco)
			@cedente = cedente
			@documento_cedente = documento_cedente
			@sacado = sacado
			@sacado_documento = sacado_documento
			@agencia = agencia
			@conta_corrente = conta_corrente
			@convenio = convenio
			@numero_documento = numero_documento
			@data_vencimento = data_vencimento
			@data_documento = data_documento
			@instrucao1 = instrucao1
			@instrucao2 = instrucao2
			@instrucao3 = instrucao3
			@sacado_endereco = sacado_endereco
		end
	end
end