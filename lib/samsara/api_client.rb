module Samsara
  class ApiClient

    SAMSARA_API_ENDPOINT  =  "https://api.samsara.com/"
    FLEET_VEHICLES_LOCATIONS_PATH = "fleet/vehicles/locations"
    SAMSARA_API_KEY = "apikey"

    def self.fetch_fleet_status
      url = URI("#{SAMSARA_API_ENDPOINT}#{FLEET_VEHICLES_LOCATIONS_PATH}")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(url)
      request["Accept"] = "application/json"
      request["Authorization"] = "Bearer #{SAMSARA_API_KEY}"

      response = http.request(request)

      if response.code == "200"
        return JSON.parse(response.read_body)["data"]
      else
        raise "Error in Samsara API response: #{response.inspect}"
      end
    end
  end
end
