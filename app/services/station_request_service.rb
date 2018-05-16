class StationRequestService
  def initialize(zip)
    @zip = zip
  end

  def conn
    Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=s7uscHW04X8llSdR1VVvLXgSsfeOMmfC3mTpeOrJ&location=#{@zip}&radius=6.0&fuel_type=ELEC,LPG")
  end

  def request
    conn.get { |req| }
  end

  def raw_stations
    JSON.parse(request.body, symbolize_names: true)[:fuel_stations]
  end
end
