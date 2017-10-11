require 'test_helper'

class NinjasControllerTest < ActionController::TestCase
  test "should get rpg" do
    get :rpg
    assert_response :success
  end

end
