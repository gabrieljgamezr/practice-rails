require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:paco)
  end

  test 'should get show' do
    get user_path(@user.username)

    assert_response :success
  end
end
