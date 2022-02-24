 require_relative 'bike'

class DockingStation
  attr_reader :rack
  attr_reader :DEFAULT_CAPACITY

  def initialize
    @rack = []
    @DEFAULT_CAPACITY = 20
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
    @rack.count >= @DEFAULT_CAPACITY
  end

  def empty?
    @rack.empty?
  end
end
