 require_relative 'bike'

class DockingStation
  attr_reader :rack
  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @rack = []
    @capacity = capacity
  end

  def release_bike
    raise 'Dock empty error' if empty?
    return @rack.pop unless @rack.last.broken? == true
    return nil
  end

  def dock(bike)
    raise 'Dock full error' if full?
    @rack << bike
  end

  private

  def full?
    @rack.count >= @capacity
  end

  def empty?
    @rack.empty?
  end
end
