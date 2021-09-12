class VehicleLocation < ApplicationRecord
  belongs_to :vehicle

  def self.add_new_location(vehicle, vehicle_info)
    last_vehicle_loc = vehicle.vehicle_location.last rescue nil
    if !last_vehicle_loc || (last_vehicle_loc.time != vehicle_info["location"]["time"])
      last_vehicle_loc = VehicleLocation.create(vehicle: vehicle,
                             time: vehicle_info["location"]["time"],
                             latitude: vehicle_info["location"]["latitude"],
                             longitude: vehicle_info["location"]["longitude"],
                             location: vehicle_info["location"]["reverseGeo"]["formattedLocation"])
    end
    return last_vehicle_loc
  end
end
