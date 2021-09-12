class Vehicle < ApplicationRecord
  has_many :vehicle_location

  def self.update_vehicles(vehicles)
    vehicle_list = []
    vehicles.each do |vehicle_info|
      vehicle = Vehicle.find_by_uid(vehicle_info["id"])
      vehicle = Vehicle.create(name: vehicle_info["name"], uid: vehicle_info["id"]) unless vehicle
      latest_location = VehicleLocation.add_new_location(vehicle, vehicle_info)
      vehicle.reload
      vehicle_list << vehicle.attributes.merge(latest_location.attributes)
    end
    return vehicle_list
  end

end
