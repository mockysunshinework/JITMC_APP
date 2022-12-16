require "test_helper"

class Users::ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_articles_new_url
    assert_response :success
  end
end
