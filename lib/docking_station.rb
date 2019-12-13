require_relative 'bike'

class DockingStation
  attr_reader :capacity

  DEFAULT_CAPACITY = 20 
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity 
    @bikes = []
  end

  def dock(bike)
    fail "Docking station full" if full?
    @bikes << bike
  end

  def release_bike
    fail "No bikes available" if empty?
    @bikes.reject { |bike| bike.broken }.pop # returns the working bikes 
    
  end

private

  def full?
    @bikes.count >= DEFAULT_CAPACITY 
  end 

  def empty?
    @bikes.empty?
  end
end
