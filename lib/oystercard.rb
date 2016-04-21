### require 'journey'

class Oystercard
  MAXIMUM_BALANCE = 31
  MINIMUM_FARE = 1

  attr_reader :balance, :journeys, :journey_log

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station, journey_log)
    fail "Not enough balance on card" if balance < MINIMUM_FARE
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  def in_journey?
   !!entry_station
  end

  private
  def deduct(fare)
    @balance -= fare
  end

end