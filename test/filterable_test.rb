require 'test_helper'

class Filterable::Test < ActionDispatch::IntegrationTest
  test "truth" do
    assert_kind_of Module, Filterable
  end

  test "gets all users when no params are passed" do
  	get users_url

  	assert_response :success

  	assert_equal 4, assigns(:users).count
  end

  test "should filter when using match filter" do
  	get users_url, params: { eye_color: 'brown' }

  	assert_response :success

  	assert_equal 2, assigns(:users).count
  end

  test "should filter when using reference filter" do
  	get users_url, params: { city: 'London' }

  	assert_response :success

  	assert_equal 2, assigns(:users).count
  end

  test "should filter when using contains filter" do
  	get users_url, params: { name: 'a' }

  	assert_response :success

  	assert_equal 3, assigns(:users).count 
  end
end
