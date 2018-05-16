require 'rails_helper'

describe 'Station Search' do
  describe 'it returns an array of stations' do
    it 'passes area code as arguement' do
      stations = StationsSearch.new(80203).stations

      expect(stations.count).to eq(10)
      expect(stations.first.name). to eq('UDR')
      expect(stations.first.address). to eq('800 Acoma St')
      expect(stations.first.distance). to eq(0.31422)
      expect(stations.first.fuel_type). to eq('ELEC')
      expect(stations.first.access_time). to eq('24 hours daily')
    end
  end
end
