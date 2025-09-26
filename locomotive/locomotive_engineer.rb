class LocomotiveEngineer
  def self.generate_list_of_wagons(*arguments)
    return arguments
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    first_two, *rest = each_wagons_id
    first_two, second_two = first_two, rest.shift
  
    remaining = rest.reject { |id| id == 1 }
  
    [1, *missing_wagons, *remaining, first_two, second_two]
  end
  
  

  def self.add_missing_stops(route, **stops_hash)
    stops = stops_hash.values
    route.merge(stops: stops)
  end 

  def self.extend_route_information(route, more_route_information)
    route.merge(more_route_information)
  end
end
