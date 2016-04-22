require_relative "journey"

class JourneyLog

  attr_reader :current_journey, :end

  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @journeys = []
  end

  def start(entry_station)
    fail 'Already in a Journey.' if current_journey.entry_station
    add(journey_class.new(entry_station: entry_station))
  end

  def current_journey
    journeys.reject(&:complete?).last || journey_class.new
  end


  #   def start_journey(station)
  #
  #   add(journey_class.new(entry_station: station))
  # end

  def finish(exit_station)
    journeys.last.end(exit_station: exit_station)
  end

  def add(journey)
    journeys << journey
  end

  def journeys
    @journeys
  end

#private
attr_reader :journey_class


end