#NameError: uninitialized constant Oystercard
#./spec/oystercard_spec.rb:3

class Oystercard

  attr_reader :balance

  MIN_FARE = 1
  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail 'You cannot have more than £90 in your balance' if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    raise "Insufficient balance." if @balance < MIN_FARE
    @in_journey = true
  end

  def touch_out
    deduct()
    @in_journey = false
  end

  private
  def deduct(fare = MIN_FARE)
    @balance -= fare
  end
end
