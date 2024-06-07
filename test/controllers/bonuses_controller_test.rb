require "test_helper"

class BonusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bonus = bonuses(:one)
  end

  test "should get index" do
    get _bonuses_url, as: :json
    assert_response :success
  end

  test "should create bonus" do
    assert_difference("Bonus.count") do
      post _bonuses_url, params: { bonus: { amount: @bonus.amount, wallet_id: @bonus.wallet_id } }, as: :json
    end

    assert_response :created
  end

  test "should show bonus" do
    get _bonus_url(@bonus), as: :json
    assert_response :success
  end

  test "should update bonus" do
    patch _bonus_url(@bonus), params: { bonus: { amount: @bonus.amount, wallet_id: @bonus.wallet_id } }, as: :json
    assert_response :success
  end

  test "should destroy bonus" do
    assert_difference("Bonus.count", -1) do
      delete _bonus_url(@bonus), as: :json
    end

    assert_response :no_content
  end
end
