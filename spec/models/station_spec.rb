require 'spec_helper'
require '../../app/models/station'

describe Station do
  describe 'contains readable attribes' do
    it 'initializes with attribues' do
      attrs = { name: 'Conoco',
                address: '123 Easy Street',
                fuel_type: 'ELEC',
                distance: '5.0',
                access_time: '24 hours' }
                
      station = Station.new(attrs)

      expect(station.name).to eq(attrs[:name])
      expect(station.name).to eq(attrs[:address])
      expect(station.name).to eq(attrs[:fuel_type])
      expect(station.name).to eq(attrs[:distance])
      expect(station.name).to eq(attrs[:access_time])
    end
  end
end
