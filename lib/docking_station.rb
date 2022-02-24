 require_relative 'bike'

class DockingStation
  attr_reader :rack

  def release_bike
    raise 'Dock empty error' if @rack == nil
    @rack
  end

  def dock(bike)
    raise 'Dock full error' if @rack != nil
    @rack = bike
  end
end
