require 'rails_helper'

describe 'Station Search' do
  describe 'it returns an array of stations' do
    it 'passes area code as arguement' do
      stations = StationSearch.new(80203).stations

      expect(station.count).to eq(10)
      expect(station.first.name). to eq('UDL')
      expect(station.first.address). to eq('UDL')
      expect(station.first.distance). to eq('UDL')
      expect(station.first.fuel_type). to eq('ELEC')
      expect(station.first.access_time). to eq('24 hours a day')
    end
  end
end
