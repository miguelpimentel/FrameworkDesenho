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
        end
    end
  end

  namespace :banco_itau do
    namespace :pag_seguro do

    end
    namespace :padrao do

    end
  end

  namespace :banco_bradesco do
    namespace :pag_seguro do

    end
    namespace :padrao do

    end
  end
end