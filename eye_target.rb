require 'ros'
require 'std_msgs/String'
require 'sensor_msgs/LaserScan'

class SelfDrivingCar
  def initialize
    @node = ROS::Node.new('self_driving_car')
    @gas_level = 100
    @hybrid_mode = true
    @lidar_subscriber = @node.subscribe('/scan', sensor_msgs/LaserScan, self.method(:process_lidar))
  end
  
  def process_lidar(data)
    # process lidar data to detect obstacles
  end
  
  def drive
    while @node.ok?
      if @gas_level < 20 && @hybrid_mode
        switch_to_electric_mode
      end
      
      # use lidar data to plan trajectory and control motors
    end
  end
  
  def switch_to_electric_mode
    # code to switch car to electric mode
  end
end

car = SelfDrivingCar.new
car.drive