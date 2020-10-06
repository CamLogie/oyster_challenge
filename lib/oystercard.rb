#NameError: uninitialized constant Oystercard
#./spec/oystercard_spec.rb:3

class Oystercard
  MIN_FARE = 1
  MAX_BALANCE = 90

  attr_reader :balance, :entry_station, :journey_history

  def initialize
    @balance = 0
    @entry_station = nil
    @journey_history = []
  end

  def top_up(amount)
    fail 'You cannot have more than £90 in your balance' if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient balance." if @balance < MIN_FARE
    @entry_station = station
    in_journey?
  end

  def touch_out(station)
    deduct()
    create_journey(station)
    @entry_station = nil
    in_journey?
  end

  private
  def deduct(fare = MIN_FARE)
    @balance -= fare
  end

  def in_journey?
    @entry_station != nil
  end

  def create_journey(station)
    journey = {
      entry_station: @entry_station,
      exit_station: station
    }
    @journey_history << journey
  end
end
