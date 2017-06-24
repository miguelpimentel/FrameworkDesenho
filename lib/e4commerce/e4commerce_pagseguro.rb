module E4commerce

require "pagseguro"

    class PagSeguroPayment

        # Email and token for different profiles to authenticate paymeny
        # e4c_payment, class must inheritate from E4commerce::E4CPayment
        def self.create_payment(e4c_payment, email, token)
            
            payment = PagSeguro::PaymentRequest.new

            payment = PagSeguro::PaymentRequest.new(email: email, token: token)

            payment.reference = order.id
            payment.notification_url = notifications_url
            payment.redirect_url = processing_url

            e4c_payment.product_list.each do |product|
              payment.items << {
                description: product.title,
                id: product.serial_number,
                amount: product.unit_price
              }
            end

            calculate_total(self.product_list)

            response = payment.register

            if response.errors.any?
              raise response.errors.join("\n")
            else
              redirect_to response.url
            end
        end

        def calculate_total(products)
            total = 0
            self.product_list.each do |product|
                total += product.unit_price
            end

            total
        end
    
        def self.create_notification(notification_code_param)
            transaction = PagSeguro::Transaction.find_by_notification_code(params[:notification_code_param])

            if transaction.errors.empty?
              # Processa a notificação. A melhor maneira de se fazer isso é realizar
              # o processamento em background. Uma boa alternativa para isso é a
              # biblioteca Sidekiq.
            end

            render nothing: true, status: 200
        end

    end

end