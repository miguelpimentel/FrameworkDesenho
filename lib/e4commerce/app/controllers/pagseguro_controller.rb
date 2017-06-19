class CheckoutController < ApplicationController
  
  def create
    # O modo como você irá armazenar os produtos que estão sendo comprados
    # depende de você. Neste caso, temos um modelo Order que referência os
    # produtos que estão sendo comprados.
    # Classe para pegar o pedido -> order = Order.find(params[:id])

    payment = PagSeguro::PaymentRequest.new
    payment.reference = order.id
    payment.notification_url = notifications_url
    payment.redirect_url = processing_url

    order.products.each do |product|
      payment.items << {
        id: product.id,
        description: product.title,
        amount: product.price,
        weight: product.weight
      }
    end

    response = payment.register

    if response.errors.any?
      raise response.errors.join("\n")
    else
      redirect_to response.url
    end

  end
end