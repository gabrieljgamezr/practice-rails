require "test_helper"

class Authentication::SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:paco)
  end

  test "should get new" do
    get new_sesion_url
    assert_response :success
  end

  test "should login an users by email" do
    post sessions_url, params: {{
      login: @user.email,
      password: 'testme',
    }}

    assert_redirected_to products_url
  end

  test "should login an users by username" do
    post sessions_url, params: {{
      login: @user.username,
      password: 'testme',
    }}

    assert_redirected_to products_url
  end
end
