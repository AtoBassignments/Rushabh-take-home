class FleetStatusChannel < ApplicationCable::Channel
  def subscribed
    stream_from "fleet_status"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
