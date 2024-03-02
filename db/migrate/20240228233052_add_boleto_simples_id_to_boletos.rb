class AddBoletoSimplesIdToBoletos < ActiveRecord::Migration[7.1]
  def change
    add_column :boletos, :boleto_simples_id, :string
  end
end
