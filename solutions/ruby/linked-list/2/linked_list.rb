class Deque
  def initialize
    @head = nil
    @tail = nil
    @stations = []
  end

  def push(value)
    station = Station.new(value)
    @stations << station

    if @head.nil?
      @head = station
    else
      @tail.next_station = station
      station.prev_station = @tail
    end
    @tail = station
  end

  def pop
    station = @tail
    @tail = station.prev_station
    @tail.next_station = nil
    station.value
  end

  def shift
    station = @head
    @head = station.next_station
    @head.prev_station = nil
    station.value
  end

  def unshift(value)
    station = Station.new(value)
    @stations.unshift(station)
    station.next_station = @head
    @head.prev_station = station
    @head = station
  end
end

class Station
  attr_reader :value
  attr_accessor :next_station, :prev_station

  def initialize(value)
    @value = value
    @next_station = nil
    @prev_station = nil
  end
end
