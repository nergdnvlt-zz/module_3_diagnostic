class SearchController < ApplicationController
  def index
    @stations = StationsSearch.new(params['q']).stations
    require 'pry'; binding.pry
  end
end

class StationsSearch

  def initialize(zip)
    @zip = zip
  end

  def stations
    conn = Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?api_key=s7uscHW04X8llSdR1VVvLXgSsfeOMmfC3mTpeOrJ&location=#{@zip}&radius=6.0&fuel_type=ELEC,LPG")

    request = conn.get { |req| }

    raw_stations = JSON.parse(request.body, symbolize_names: true)[:fuel_stations]
    stations = raw_stations.map do |station|
      Station.new(station)
    end

    sorted_stations = stations.sort_by { |station| station.distance }
    sorted_stations[0..9]
  end
end

# class Station
#   attr_reader :name, :address, :fuel_type, :distance, :access_time
#
#   def initialize(attrs)
#     @name = attrs[:station_name]
#     @address = attrs[:street_address]
#     @fuel_type = attrs[:fuel_type_code]
#     @distance = attrs[:distance]
#     @access_time = attrs[:access_days_time]
#   end
# end
