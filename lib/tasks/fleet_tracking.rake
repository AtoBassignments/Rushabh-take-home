namespace :fleet_tracking do
  desc "Poll API for vehicles status every 10 seconds and update db and consumers"
  task update_fleet_status: :environment do
    while true do
      fleet_data = Samsara::ApiClient.fetch_fleet_status
      updated_vehicles = Vehicle.update_vehicles(fleet_data)
      ActionCable.server.broadcast("fleet_status", {updated_vehicles: updated_vehicles})
      sleep 10.seconds
    end
  end
end
