class StationsSearch
  def initialize(zip)
    @zip = zip
  end

  def stations
    sorted_stations[0..9]
  end

  private

  def request
    StationRequestService.new(@zip).raw_stations
  end

  def station_objects
    request.map do |station|
      Station.new(station)
    end
  end

  def sorted_stations
    station_objects.sort_by { |station| station.distance }
  end
end

# class StationRequestService
#   def initialize(zip)
#     @zip = zip
#   end
#
#   def conn
#     Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=s7uscHW04X8llSdR1VVvLXgSsfeOMmfC3mTpeOrJ&location=#{@zip}&radius=6.0&fuel_type=ELEC,LPG")
#   end
#
#   def request
#     conn.get { |req| }
#   end
#
#   def raw_stations
#     JSON.parse(request.body, symbolize_names: true)[:fuel_stations]
#   end
# end
