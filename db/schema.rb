# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_28_233052) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boletos", force: :cascade do |t|
    t.float "amount"
    t.string "description"
    t.date "expire_at"
    t.integer "bank_billet_account_id"
    t.integer "bank_billet_layout_id"
    t.bigint "cliente_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "boleto_simples_id"
    t.index ["cliente_id"], name: "index_boletos_on_cliente_id"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "person_name"
    t.string "address"
    t.string "neighborhood"
    t.string "zipcode"
    t.string "city_name"
    t.string "address_number"
    t.string "cnpj_cpf"
    t.string "email"
    t.string "person_type"
    t.string "phone_number"
    t.string "state"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "boletos", "clientes"
end
