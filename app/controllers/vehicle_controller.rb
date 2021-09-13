class VehicleController < ApplicationController
  def latest_fleet_location
    fleet_data = Samsara::ApiClient.fetch_fleet_status
    updated_vehicles = Vehicle.update_vehicles(fleet_data)
    ActionCable.server.broadcast("fleet_status", {updated_vehicles: updated_vehicles})
  end
end
