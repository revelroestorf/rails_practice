require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get authors" do
    get pages_authors_url
    assert_response :success
  end

  test "should get books" do
    get pages_books_url
    assert_response :success
  end

end
