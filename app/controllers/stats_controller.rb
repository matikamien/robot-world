class StatsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def get_daily_report
    stats_service = get_stats_service
    render json: { daily_revenue: stats_service.daily_revenue,
                   sold_cars: stats_service.sold_cars,
                   average_order_value: stats_service.average_order_value }
  end

  def get_stats_service
    StatsService.new OrderService.new
  end

end
