require 'test_helper'

class ProductsTest < ActionDispatch::IntegrationTest
  test "lets a signed in user create a new product" do
    # setup
    login_as users(:george)

    # exercise
    visit "/products/new"

    fill_in "product_name", with: "Le Wagon"


    fill_in "product_tagline", with: "Change your life: Learn to code"
    click_button 'Create Product'



    # veryfy
    # Should be redirected to Home with new product
    # save_and_open_screenshot
    assert_equal root_path, page.current_path
    assert_equal 200, page.status_code
    assert page.has_content?("Le Wagon")
    assert page.has_content?("Change your life: Learn to code")

    # teardown
    # no
  end
end
