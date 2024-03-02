class CreateBoletos < ActiveRecord::Migration[7.1]
  def change
    create_table :boletos do |t|
      t.float :amount
      t.string :description
      t.date :expire_at
      t.integer :bank_billet_account_id
      t.integer :bank_billet_layout_id
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
