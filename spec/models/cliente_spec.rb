# spec/models/cliente_spec.rb
require 'rails_helper'

RSpec.describe Cliente, type: :model do
  context 'validations' do
    it 'is valid with all required attributes' do
      cliente = Cliente.new(person_name: 'John Doe', address: '123 Main St', neighborhood: 'Downtown', zipcode: '12345', city_name: 'Big City')
      expect(cliente).to be_valid
    end

    it 'is not valid without person_name' do
      cliente = Cliente.new(address: '123 Main St', neighborhood: 'Downtown', zipcode: '12345', city_name: 'Big City')
      expect(cliente).not_to be_valid
      expect(cliente.errors[:person_name]).to include("can't be blank")
    end

    it 'is not valid without address' do
      cliente = Cliente.new(person_name: 'John Doe', neighborhood: 'Downtown', zipcode: '12345', city_name: 'Big City')
      expect(cliente).not_to be_valid
      expect(cliente.errors[:address]).to include("can't be blank")
    end

    it 'is not valid without neighborhood' do
      cliente = Cliente.new(person_name: 'John Doe', address: '123 Main St', zipcode: '12345', city_name: 'Big City')
      expect(cliente).not_to be_valid
      expect(cliente.errors[:neighborhood]).to include("can't be blank")
    end

    it 'is not valid without zipcode' do
      cliente = Cliente.new(person_name: 'John Doe', address: '123 Main St', neighborhood: 'Downtown', city_name: 'Big City')
      expect(cliente).not_to be_valid
      expect(cliente.errors[:zipcode]).to include("can't be blank")
    end

    it 'is not valid without city_name' do
      cliente = Cliente.new(person_name: 'John Doe', address: '123 Main St', neighborhood: 'Downtown', zipcode: '12345')
      expect(cliente).not_to be_valid
      expect(cliente.errors[:city_name]).to include("can't be blank")
    end
  end

  context 'associations' do
    it 'has many boletos' do
      association = Cliente.reflect_on_association(:boletos)
      expect(association.macro).to eq :has_many
    end
  end
end
