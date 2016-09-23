require 'test_helper'

class TestadorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get testador_index_url
    assert_response :success
  end

end
