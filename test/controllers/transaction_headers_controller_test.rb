require 'test_helper'

class TransactionHeadersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaction_header = transaction_headers(:one)
  end

  test "should get index" do
    get transaction_headers_url
    assert_response :success
  end

  test "should get new" do
    get new_transaction_header_url
    assert_response :success
  end

  test "should create transaction_header" do
    assert_difference('TransactionHeader.count') do
      post transaction_headers_url, params: { transaction_header: { account: @transaction_header.account, reconciled: @transaction_header.reconciled, sign: @transaction_header.sign, supplier: @transaction_header.supplier, total: @transaction_header.total, transaction_date: @transaction_header.transaction_date, user: @transaction_header.user } }
    end

    assert_redirected_to transaction_header_url(TransactionHeader.last)
  end

  test "should show transaction_header" do
    get transaction_header_url(@transaction_header)
    assert_response :success
  end

  test "should get edit" do
    get edit_transaction_header_url(@transaction_header)
    assert_response :success
  end

  test "should update transaction_header" do
    patch transaction_header_url(@transaction_header), params: { transaction_header: { account: @transaction_header.account, reconciled: @transaction_header.reconciled, sign: @transaction_header.sign, supplier: @transaction_header.supplier, total: @transaction_header.total, transaction_date: @transaction_header.transaction_date, user: @transaction_header.user } }
    assert_redirected_to transaction_header_url(@transaction_header)
  end

  test "should destroy transaction_header" do
    assert_difference('TransactionHeader.count', -1) do
      delete transaction_header_url(@transaction_header)
    end

    assert_redirected_to transaction_headers_url
  end
end
