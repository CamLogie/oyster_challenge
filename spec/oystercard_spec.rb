require 'oystercard'

describe Oystercard do
  it 'checks that the oystercard has an initial value of 0' do
  expect(subject.balance).to eq 0
  end
end
