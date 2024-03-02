class CreateClientes < ActiveRecord::Migration[7.1]
  def change
    create_table :clientes do |t|
      t.string :person_name
      t.string :address
      t.string :neighborhood
      t.string :zipcode
      t.string :city_name
      t.string :address_number
      t.string :cnpj_cpf
      t.string :email
      t.string :person_type
      t.string :phone_number
      t.string :state
      t.string :description

      t.timestamps
    end
  end
end
