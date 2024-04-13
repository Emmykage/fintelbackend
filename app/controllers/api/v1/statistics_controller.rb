class Api::V1::StatisticsController < ApplicationController
  before_action :intialize_statistics

  # GET /statistics
  def index
    @statistic = Statistic.all.first

    render json: @statistic
  end

end