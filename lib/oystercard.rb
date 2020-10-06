#NameError: uninitialized constant Oystercard
#./spec/oystercard_spec.rb:3

class Oystercard

  attr_reader :balance, :entry_station

  MIN_FARE = 1
  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @entry_station = nil
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

  def touch_out
    deduct()
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
end
