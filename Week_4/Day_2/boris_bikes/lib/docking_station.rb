class DockingStation

  DEFAULT_CAPACITY = 5

  def initialize options = {}
    # This way is better cause we set a default value just in case
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    # SAME but normal way of doing: @capacity = options[:capacity]
    @bikes = []
  end

  def bike_count
    @bikes.count
  end

  def dock bike
    raise 'Station is full' if full?
    @bikes << bike
  end

  def release bike
    @bikes.delete bike
  end

  def full?
    bike_count == @capacity
  end

end