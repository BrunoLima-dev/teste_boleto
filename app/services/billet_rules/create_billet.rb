module BilletRules
  class CreateBillet
    def initialize(billet)
      @billet = billet
    end

    def call
      @response = BoletoSimples::BankBillet.create(
        amount: @billet.amount,
        expire_at: @billet.expire_at,
        customer_address: @billet.cliente.address,
        customer_address_number: @billet.cliente.address_number,
        customer_city_name: @billet.cliente.city_name,
        customer_cnpj_cpf: @billet.cliente.cnpj_cpf,
        customer_email: @billet.cliente.email,
        customer_neighborhood: @billet.cliente.neighborhood,
        customer_person_name: @billet.cliente.person_name,
        customer_person_type: @billet.cliente.person_type,
        customer_phone_number: @billet.cliente.phone_number,
        customer_state: @billet.cliente.state,
        customer_zipcode: @billet.cliente.zipcode
      )

      if @response.errors.present?
        @billet.api_errors = @response.errors.full_messages.join(', ')
        raise StandardError, "Error creating customer: #{@response}"
      else
        puts 'Billet created successfully!'
      end
    end
  end
end
