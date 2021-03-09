class OrderChangesController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create_order_change
    begin
      @order_change = create_order(params[:order_id], params[:car_model])
      render json: @order_change
    rescue OrderChangeService::OrderNotFoundError => e
      render :json => error_info("order_not_found", "The requested order does not exist").to_json, :status => 400
    rescue OrderChangeService::NoStockError => e
      render :json => error_info("no_stock", "There is no stock available for the requested model").to_json, :status => 400
    end
  end

  def create_order(order_id, car_model)
    OrderChangeService.new(order_id, car_model, StockService.new , OrderService.new).create_order_change_if_applies
  end

  def error_info error, error_description
    { error: error, error_description: error_description }
  end

end
