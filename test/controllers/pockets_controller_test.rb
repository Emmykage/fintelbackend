require "test_helper"

class PocketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pocket = pockets(:one)
  end

  test "should get index" do
    get pockets_url, as: :json
    assert_response :success
  end

  test "should create pocket" do
    assert_difference("Pocket.count") do
      post pockets_url, params: { pocket: { code: @pocket.code, name: @pocket.name, user_id: @pocket.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show pocket" do
    get pocket_url(@pocket), as: :json
    assert_response :success
  end

  test "should update pocket" do
    patch pocket_url(@pocket), params: { pocket: { code: @pocket.code, name: @pocket.name, user_id: @pocket.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy pocket" do
    assert_difference("Pocket.count", -1) do
      delete pocket_url(@pocket), as: :json
    end

    assert_response :no_content
  end
end
