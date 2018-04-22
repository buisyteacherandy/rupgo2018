require 'test_helper'

class UserProvidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_provider = user_providers(:one)
  end

  test "should get index" do
    get user_providers_url
    assert_response :success
  end

  test "should get new" do
    get new_user_provider_url
    assert_response :success
  end

  test "should create user_provider" do
    assert_difference('UserProvider.count') do
      post user_providers_url, params: { user_provider: { provider: @user_provider.provider, uid: @user_provider.uid, user_id: @user_provider.user_id } }
    end

    assert_redirected_to user_provider_url(UserProvider.last)
  end

  test "should show user_provider" do
    get user_provider_url(@user_provider)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_provider_url(@user_provider)
    assert_response :success
  end

  test "should update user_provider" do
    patch user_provider_url(@user_provider), params: { user_provider: { provider: @user_provider.provider, uid: @user_provider.uid, user_id: @user_provider.user_id } }
    assert_redirected_to user_provider_url(@user_provider)
  end

  test "should destroy user_provider" do
    assert_difference('UserProvider.count', -1) do
      delete user_provider_url(@user_provider)
    end

    assert_redirected_to user_providers_url
  end
end
