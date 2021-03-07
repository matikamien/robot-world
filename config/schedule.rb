set :output, "log/cron.log"
set :environment, "development"

every 1.minute do
  runner "RobotBuilder.create_ten_cars"
end

every 1.day, at: '11:59 pm' do
  runner "RobotBuilder.remove_incomplete_cars"
end