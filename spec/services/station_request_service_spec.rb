require 'rails_helper'

describe 'Station Search' do
  describe 'it returns an array of stations' do
    it 'passes area code as arguement' do
      response = StationRequestService.new(80203).raw_stations

      # expect(response).to have_content(response[:station_name])
    end
  end
end
