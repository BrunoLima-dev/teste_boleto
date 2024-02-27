class CreateClientes < ActiveRecord::Migration[7.1]
  def change
    create_table :clientes do |t|
      t.string :person_name
      t.string :address
      t.string :neighborhood
      t.string :zipcode
      t.string :city_name

      t.timestamps
    end
  end
end
