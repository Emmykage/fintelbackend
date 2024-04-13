require "test_helper"

class StatisticsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @statistic = statistics(:one)
  end

  test "should get index" do
    get statistics_url, as: :json
    assert_response :success
  end

  test "should create statistic" do
    assert_difference("Statistic.count") do
      post statistics_url, params: { statistic: { deposit: @statistic.deposit, profit: @statistic.profit, user: @statistic.user, withdrawal: @statistic.withdrawal } }, as: :json
    end

    assert_response :created
  end

  test "should show statistic" do
    get statistic_url(@statistic), as: :json
    assert_response :success
  end

  test "should update statistic" do
    patch statistic_url(@statistic), params: { statistic: { deposit: @statistic.deposit, profit: @statistic.profit, user: @statistic.user, withdrawal: @statistic.withdrawal } }, as: :json
    assert_response :success
  end

  test "should destroy statistic" do
    assert_difference("Statistic.count", -1) do
      delete statistic_url(@statistic), as: :json
    end

    assert_response :no_content
  end
end
