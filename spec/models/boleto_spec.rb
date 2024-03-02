require 'rails_helper'

RSpec.describe Boleto, type: :model do
  context 'validations' do
    it 'is valid with amount, expire_at, and cliente_id present' do
      boleto = Boleto.new(amount: 100, expire_at: Date.today + 1.day, cliente_id: 1)
      expect(boleto).to be_valid
    end

    it 'is not valid without amount' do
      boleto = Boleto.new(expire_at: Date.today + 1.day, cliente_id: 1)
      expect(boleto).not_to be_valid
      expect(boleto.errors[:amount]).to include("can't be blank")
    end

    it 'is not valid without expire_at' do
      boleto = Boleto.new(amount: 100, cliente_id: 1)
      expect(boleto).not_to be_valid
      expect(boleto.errors[:expire_at]).to include("can't be blank")
    end

    it 'is not valid with non-numeric amount' do
      boleto = Boleto.new(amount: 'abc', expire_at: Date.today + 1.day, cliente_id: 1)
      expect(boleto).not_to be_valid
      expect(boleto.errors[:amount]).to include("is not a number")
    end

    it 'is not valid with amount less than or equal to zero' do
      boleto = Boleto.new(amount: 0, expire_at: Date.today + 1.day, cliente_id: 1)
      expect(boleto).not_to be_valid
      expect(boleto.errors[:amount]).to include("must be greater than 0")
    end

    it 'is not valid with retroactive expire_at' do
      boleto = Boleto.new(amount: 100, expire_at: Date.today - 1.day, cliente_id: 1)
      expect(boleto).not_to be_valid
      expect(boleto.errors[:expire_at]).to include("Expiration date cannot be retroactive.")
    end
  end
end
