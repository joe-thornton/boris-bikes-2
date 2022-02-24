 require_relative 'bike'

class DockingStation
  attr_reader :rack

  def initialize
    @rack = []
  end

  def release_bike
    raise 'Dock empty error' if @rack.empty?
    @rack.pop
  end

  def dock(bike)
    raise 'Dock full error' if @rack.count >= 20
    @rack << bike
  end
end
