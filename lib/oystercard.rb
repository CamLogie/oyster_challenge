#NameError: uninitialized constant Oystercard
#./spec/oystercard_spec.rb:3

class Oystercard

  attr_reader :balance 

  def initialize
    @balance = 0
  end

end
