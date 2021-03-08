require 'rails_helper'

RSpec.describe StatsService, type: :model do

  let(:order_service) { OrderService.new }
  let(:output_creator) { JsonCreator.new }
  let(:stats_service) { StatsService.new order_service,output_creator }

  it "should calculate daily revenue, sold cars and average order value" do
    car = Car.create!(model:"Corsa", year:2020, price:15000, cost_price:1000)
    other_car = Car.create!(model:"Megane", year:2008, price:6000, cost_price:3200)
    3.times { create_order car }
    4.times { create_order other_car }

    stats = stats_service.get_stats

    expect(stats[:daily_revenue]).to eq 69000
    expect(stats[:sold_cars]).to eq 7
    expect(stats[:average_order_value].to_f).to eq 9857.14
  end

  def create_order car
    Order.create! car_id:car.id
  end

end
