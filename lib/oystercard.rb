#
require_relative 'journey_log'
class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :entry_station, :journeys, :journey_log

  def initialize(journey_log = JourneyLog.new)
    @balance = 0
    @journey_log = journey_log
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(entry_station)
    fail "Not enough balance on card" if balance < MINIMUM_FARE
    journey_log.start(entry_station)
  end

  def touch_out(exit_station)
    journey_log.finish(exit_station)
  end

  def in_journey?
   !!entry_station
  end

  private
  def deduct(fare)
    @balance -= fare
  end

end