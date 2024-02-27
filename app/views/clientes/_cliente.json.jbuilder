json.extract! cliente, :id, :person_name, :address, :neighborhood, :zipcode, :city_name, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
