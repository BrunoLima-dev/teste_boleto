class Cliente < ApplicationRecord
  has_many :boletos

  validates :person_name, :address, :neighborhood, :zipcode, :city_name, presence: true
  validates :cnpj_cpf, presence: true, uniqueness: true

  serialize :api_errors, JSON
end
