set :output, { error: 'log/error.log', standard: 'log/cron.log' }
set :environment, "development"

every 1.minutes do
  runner "RobotBuilder.create_ten_cars"
end

every 1.day, at: '11:59 pm' do
  runner "RobotBuilder.remove_incomplete_cars"
end

every 30.minutes do
  runner "GuardRobotService.transfer_stock_and_notify_defects"
end

every 30.minutes do
  runner "RobotBuyerService.buy_cars"
end