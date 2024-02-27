class CreateBoletos < ActiveRecord::Migration[7.1]
  def change
    create_table :boletos do |t|
      t.float :amount
      t.date :expire_at
      t.integer :bank_billet_account_id
      t.integer :bank_billet_layout_id

      t.timestamps
    end
  end
end
