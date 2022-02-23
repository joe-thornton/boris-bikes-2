 require_relative 'bike'

class DockingStation

  @rack = []

  def release_bike
    return Bike.new
  end

  def dock(bike)
    true
  end
end