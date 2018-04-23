require 'test_helper'

class CapabilitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @capability = capabilities(:one)
  end

  test "should get index" do
    get capabilities_url
    assert_response :success
  end

  test "should get new" do
    get new_capability_url
    assert_response :success
  end

  test "should create capability" do
    assert_difference('Capability.count') do
      post capabilities_url, params: { capability: { description: @capability.description, level: @capability.level, recommendation: @capability.recommendation, subcategory_id: @capability.subcategory_id } }
    end

    assert_redirected_to capability_url(Capability.last)
  end

  test "should show capability" do
    get capability_url(@capability)
    assert_response :success
  end

  test "should get edit" do
    get edit_capability_url(@capability)
    assert_response :success
  end

  test "should update capability" do
    patch capability_url(@capability), params: { capability: { description: @capability.description, level: @capability.level, recommendation: @capability.recommendation, subcategory_id: @capability.subcategory_id } }
    assert_redirected_to capability_url(@capability)
  end

  test "should destroy capability" do
    assert_difference('Capability.count', -1) do
      delete capability_url(@capability)
    end

    assert_redirected_to capabilities_url
  end
end
