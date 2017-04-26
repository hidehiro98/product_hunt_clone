require "test_helper"

class HomeTest < ActionDispatch::IntegrationTest
  test "loads correctly" do

    # setup
    # no

    # exercise
    visit "/"

    # save_and_open_screenshot
    # save_and_open_page
    # puts page.html

    # verify
    assert_equal 200, page.status_code
    assert page.has_content?("Products")
    assert page.has_selector?('.product', count: Product.count)
    # assert page.has_selector?('.product', count: 42)

    # teardown
  end
end
