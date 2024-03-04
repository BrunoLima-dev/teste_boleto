class Cliente < ApplicationRecord
  has_many :boletos

  validates :person_name, :address, :neighborhood, :zipcode, :city_name, presence: true

  serialize :api_errors, JSON

  before_save :create_custumer_api

  private

  def create_custumer_api
    ::CustomerRules::CreateCustomer.new(self).call
  end
end
