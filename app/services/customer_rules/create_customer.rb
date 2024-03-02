module CustomerRules
  class CreateCustomer
    def initialize(customer)
      @customer = customer
    end

    def call
      @response = BoletoSimples::Customer.create(
        person_name: @customer.person_name,
        cnpj_cpf: @customer.cnpj_cpf,
        email: @customer.email,
        address: @customer.address,
        city_name: @customer.city_name,
        state: @customer.state,
        neighborhood: @customer.neighborhood,
        zipcode: @customer.zipcode,
        address_number: @customer.address_number,
        phone_number: @customer.phone_number
      )

      if @response.errors.present?
        # A API retornou um erro, então não salvamos o cliente localmente
        raise StandardError, "Error creating customer: #{@response}"
      else
        # A API retornou sucesso, então salvamos o cliente localmente
        @customer.save
      end
    end
  end
end
