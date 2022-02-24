 require_relative 'bike'

class DockingStation
  attr_reader :rack

  def initialize
    @rack = []
  end

  def release_bike
    raise 'Dock empty error' if empty?
    @rack.pop
  end

  def dock(bike)
    raise 'Dock full error' if full?
    @rack << bike
  end

  private

  def full?
    @rack.count >= 20
  end

  def empty?
    @rack.empty?
  end
end
