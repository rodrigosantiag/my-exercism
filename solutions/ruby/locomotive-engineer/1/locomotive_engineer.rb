class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagons)
    wagons
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    (before_last, last, first, *remaining_each_wagons) = each_wagons_id

    [first, missing_wagons, remaining_each_wagons, before_last, last].flatten
  end

  def self.add_missing_stops(route, **stops)
    { **route, stops: stops.values }
  end

  def self.extend_route_information(route, more_route_information)
    {**route, **more_route_information}
  end
end
