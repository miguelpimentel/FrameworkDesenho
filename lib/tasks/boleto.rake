module Boleto

  def self.generate

  end

end


namespace :boleto do
  namespace :banco_do_brasil do
    namespace :pag_seguro do
        task :generate_boleto do
            puts "Here must be generate boleto of banco do brasil with pagseguro"
        end
    end
    namespace :padrao do
        task :generate_boleto do
            puts "Here must be generate boleto of banco do brasil padrao"
            @bank_billet = BoletoSimples::BankBillet.create({
              amount: ,#inserir valor,
              description: '', #inserir descrição
              expire_at: '', #inserir data de vencimento
              customer_address: '', #endereco do cliente
              customer_address_complement: '', #complemento do endereco do cliente
              customer_address_number: '', #número do endereço do cliente
              customer_city_name: '', #inserir cidade do cliente
              customer_cnpj_cpf: '', #inserir CPF do cliente
              customer_email: '', #inserir email do cliente
              customer_neighborhood: '', #bairro do cliente
              customer_person_name: '', #nome do cliente
              customer_person_type: 'individual',
              customer_phone_number: '',#telefone
              customer_state: '', #estado
              customer_zipcode: '' #CEP do cliente
            })

        end
    end
  end

  namespace :banco_itau do
    namespace :pag_seguro do

    end
    namespace :padrao do
      @bank_billet = BoletoSimples::BankBillet.create({
        amount: ,#inserir valor,
        description: '', #inserir descrição
        expire_at: '', #inserir data de vencimento
        customer_address: '', #endereco do cliente
        customer_address_complement: '', #complemento do endereco do cliente
        customer_address_number: '', #número do endereço do cliente
        customer_city_name: '', #inserir cidade do cliente
        customer_cnpj_cpf: '', #inserir CPF do cliente
        customer_email: '', #inserir email do cliente
        customer_neighborhood: '', #bairro do cliente
        customer_person_name: '', #nome do cliente
        customer_person_type: 'individual',
        customer_phone_number: '',#telefone
        customer_state: '', #estado
        customer_zipcode: '' #CEP do cliente
      })
    end
  end

  namespace :banco_bradesco do
    namespace :pag_seguro do

    end
    namespace :padrao do
      @bank_billet = BoletoSimples::BankBillet.create({
        amount: ,#inserir valor,
        description: '', #inserir descrição
        expire_at: '', #inserir data de vencimento
        customer_address: '', #endereco do cliente
        customer_address_complement: '', #complemento do endereco do cliente
        customer_address_number: '', #número do endereço do cliente
        customer_city_name: '', #inserir cidade do cliente
        customer_cnpj_cpf: '', #inserir CPF do cliente
        customer_email: '', #inserir email do cliente
        customer_neighborhood: '', #bairro do cliente
        customer_person_name: '', #nome do cliente
        customer_person_type: 'individual',
        customer_phone_number: '',#telefone
        customer_state: '', #estado
        customer_zipcode: '' #CEP do cliente
      })
    end
  end
end