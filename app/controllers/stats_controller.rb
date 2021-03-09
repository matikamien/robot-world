class StatsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def get_daily_report
    render json: get_stats_service.get_stats
  end

  def get_stats_service
    StatsService.new(OrderService.new, JsonCreatorService.new)
  end

end
