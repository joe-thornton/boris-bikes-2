 require_relative 'bike'

class DockingStation
  attr_reader :rack

  def initialize
    @rack = Bike.new
  end

  def release_bike
    bike = Bike.new
  end

  def dock(bike)
    @rack = bike
  end
end