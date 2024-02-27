json.extract! boleto, :id, :amount, :expire_at, :bank_billet_account_id, :bank_billet_layout_id, :created_at, :updated_at
json.url boleto_url(boleto, format: :json)
