require 'test_helper'

class RailsControllerTest < ActionDispatch::IntegrationTest
  test "should get g" do
    get rails_g_url
    assert_response :success
  end

  test "should get model" do
    get rails_model_url
    assert_response :success
  end

  test "should get book" do
    get rails_book_url
    assert_response :success
  end

  test "should get title:string" do
    get rails_title:string_url
    assert_response :success
  end

  test "should get opinion:text" do
    get rails_opinion:text_url
    assert_response :success
  end

end
