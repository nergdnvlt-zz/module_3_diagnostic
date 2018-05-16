class Station
  attr_reader :name, :address, :fuel_type, :distance, :access_time

  def initialize(attrs)
    @name = attrs[:station_name]
    @address = attrs[:street_address]
    @fuel_type = attrs[:fuel_type_code]
    @distance = attrs[:distance]
    @access_time = attrs[:access_days_time]
  end
end
