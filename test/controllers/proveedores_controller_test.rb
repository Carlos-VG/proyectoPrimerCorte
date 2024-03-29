require "test_helper"

class ProveedoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get proveedores_index_url
    assert_response :success
  end

  test "should get show" do
    get proveedores_show_url
    assert_response :success
  end

  test "should get new" do
    get proveedores_new_url
    assert_response :success
  end

  test "should get edit" do
    get proveedores_edit_url
    assert_response :success
  end

  test "should get create" do
    get proveedores_create_url
    assert_response :success
  end

  test "should get update" do
    get proveedores_update_url
    assert_response :success
  end

  test "should get destroy" do
    get proveedores_destroy_url
    assert_response :success
  end
end
