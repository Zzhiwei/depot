require "test_helper"

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success
    # type of test that assert_select performs varies based on the type of the second parameter
    assert_select 'nav a', minimum: 4
    # verifies that there are three li elements inside a ul
    assert_select 'main ul li', 3
    # verifies that there’s an h2 element with the title of the Ruby book
    assert_select 'h2', 'Programming Ruby 1.9'
    # verifies that the price is formatted correctly.
    assert_select 'div', /\$[,\d]+\.\d\d/
  end
end
