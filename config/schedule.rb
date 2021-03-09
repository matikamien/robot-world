set :output, "log/cron.log"
set :environment, "development"

every 1.minute do
  runner "RobotBuilderService.create_ten_cars"
end

every 1.day, at: '11:59 pm' do
  runner "RobotBuilderService.remove_incomplete_cars"
end

every 30.minute do
  runner "GuardRobotService.transfer_stock_and_notify_defects"
end

every 30.minute do
  runner "RobotBuyerService.buy_cars"
end