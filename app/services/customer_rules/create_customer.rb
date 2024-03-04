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
        @customer.api_errors = @response.errors.full_messages.join(', ')
        raise StandardError, "Error creating customer: #{@response}"
      else
        puts 'Customer created successfully!'
      end
    end
  end
end
