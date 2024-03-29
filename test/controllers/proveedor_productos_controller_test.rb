require "test_helper"

class ProveedorProductosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get proveedor_productos_index_url
    assert_response :success
  end

  test "should get show" do
    get proveedor_productos_show_url
    assert_response :success
  end

  test "should get new" do
    get proveedor_productos_new_url
    assert_response :success
  end

  test "should get edit" do
    get proveedor_productos_edit_url
    assert_response :success
  end

  test "should get create" do
    get proveedor_productos_create_url
    assert_response :success
  end

  test "should get update" do
    get proveedor_productos_update_url
    assert_response :success
  end

  test "should get destroy" do
    get proveedor_productos_destroy_url
    assert_response :success
  end
end
