class Boleto < ApplicationRecord
  validates :amount, :expire_at, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validate :expire_at_deve_ser_futura

  belongs_to :cliente
  before_save :create_billet_api

  private

  def expire_at_deve_ser_futura
    if expire_at.present? && expire_at < Date.today
      errors.add(:expire_at, "Expiration date cannot be retroactive.")
    end
  end

  def create_billet_api
    ::BilletRules::CreateBillet.new(self).call
  end
end
