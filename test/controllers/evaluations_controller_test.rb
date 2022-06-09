require 'test_helper'

class EvaluationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get evaluations_create_url
    assert_response :success
  end

  test "should get update" do
    get evaluations_update_url
    assert_response :success
  end

end
