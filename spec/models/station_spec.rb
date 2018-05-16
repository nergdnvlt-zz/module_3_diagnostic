require 'spec_helper'
require './app/models/station'

describe Station do
  describe 'contains readable attribes' do
    it 'initializes with attribues' do
      attrs = { station_name: 'Conoco',
                street_address: '123 Easy Street',
                fuel_type_code: 'ELEC',
                distance: '5.0',
                access_days_time: '24 hours' }

      station = Station.new(attrs)

      expect(station.name).to eq(attrs[:station_name])
      expect(station.address).to eq(attrs[:street_address])
      expect(station.fuel_type).to eq(attrs[:fuel_type_code])
      expect(station.distance).to eq(attrs[:distance])
      expect(station.access_time).to eq(attrs[:access_days_time])
    end
  end
end
