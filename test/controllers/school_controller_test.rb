require 'test_helper'

class SchoolControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get school_show_url
    assert_response :success
  end

end
