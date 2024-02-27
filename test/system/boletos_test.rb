require "application_system_test_case"

class BoletosTest < ApplicationSystemTestCase
  setup do
    @boleto = boletos(:one)
  end

  test "visiting the index" do
    visit boletos_url
    assert_selector "h1", text: "Boletos"
  end

  test "should create boleto" do
    visit boletos_url
    click_on "New boleto"

    fill_in "Amount", with: @boleto.amount
    fill_in "Bank billet account", with: @boleto.bank_billet_account_id
    fill_in "Bank billet layout", with: @boleto.bank_billet_layout_id
    fill_in "Expire at", with: @boleto.expire_at
    click_on "Create Boleto"

    assert_text "Boleto was successfully created"
    click_on "Back"
  end

  test "should update Boleto" do
    visit boleto_url(@boleto)
    click_on "Edit this boleto", match: :first

    fill_in "Amount", with: @boleto.amount
    fill_in "Bank billet account", with: @boleto.bank_billet_account_id
    fill_in "Bank billet layout", with: @boleto.bank_billet_layout_id
    fill_in "Expire at", with: @boleto.expire_at
    click_on "Update Boleto"

    assert_text "Boleto was successfully updated"
    click_on "Back"
  end

  test "should destroy Boleto" do
    visit boleto_url(@boleto)
    click_on "Destroy this boleto", match: :first

    assert_text "Boleto was successfully destroyed"
  end
end
