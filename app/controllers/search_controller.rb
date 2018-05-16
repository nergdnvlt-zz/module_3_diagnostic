class SearchController < ApplicationController
  def index
    @stations = StationsSearch.new(params['q']).stations
  end
end
