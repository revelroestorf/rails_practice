require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get hotels" do
    get pages_hotels_url
    assert_response :success
  end

end
