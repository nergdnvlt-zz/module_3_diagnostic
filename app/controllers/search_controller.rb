class SearchController < ApplicationController
  def index
    @stations = StationsSearch.new(params['q']).stations
  end
end

class StationsSearch

  def initialize
    @zip = zip
  end

  def stations
    conn = Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=s7uscHW04X8llSdR1VVvLXgSsfeOMmfC3mTpeOrJ&location=#{zip}&radius=6.0&fuel_type=ELEC,LPG")

    request = conn.get { |req| }

    raw_stations = JSON.parse(request.body, symbolize_names: true)

    raw_stations.map do |station|
      Station.new(station)
    end
  end
end