require 'test_helper'

class Admin::LocationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in admin_users(:one)
    @location = locations(:one)
  end

  test "should get index" do
    get admin_locations_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_location_url
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post admin_locations_url, params: { location: { address: @location.address, city: @location.city, company_name: @location.company_name, email: @location.email, name: @location.name, phone: @location.phone, state: @location.state, website: @location.website, zip: @location.zip, category: @location.category, description: @location.description } }
    end
  end

  test "should show location" do
    get location_url(@location)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_location_url(@location)
    assert_response :success
  end

  test "should update location" do
    patch admin_location_url(@location), params: { location: { address: @location.address, city: @location.city, company_name: @location.company_name, email: @location.email, name: @location.name, phone: @location.phone, state: @location.state, website: @location.website, zip: @location.zip, category: @location.category, description: @location.description } }
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete admin_location_url(@location)
    end
  end

end