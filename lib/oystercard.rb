#NameError: uninitialized constant Oystercard
#./spec/oystercard_spec.rb:3

class Oystercard

  attr_reader :balance

  MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail 'You cannot have more than £90 in your balance' if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

end
