set :output, "log/cron.log"
set :environment, "development"

every 1.minute do
  runner "RobotBuilder.create_ten_cars"
end