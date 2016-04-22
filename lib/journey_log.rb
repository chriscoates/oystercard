require_relative "journey"

class JourneyLog

  attr_reader :journeys, :journey, :current_journey, :journey_class

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(entry_station)
    fail 'Already in a Journey.' if current_journey.entry_station
    add(journey_class.new(entry_station: entry_station))
  end

  def current_journey
    journeys.last(&:complete?) || journey_class.new
  end


  #   def start_journey(station)
  #
  #   add(journey_class.new(entry_station: station))
  # end

  def finish(exit_station)
    journey_class.finish(exit_station)
    add(journey_class)
  end

  def add(journey)
    journeys << journey
  end

end