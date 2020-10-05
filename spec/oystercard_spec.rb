require 'oystercard'

describe Oystercard do
  it 'checks that the oystercard has an initial value of 0' do
  expect(subject.balance).to eq 0
  end

  describe '#top_up' do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'checks that the top up method can increase the balance' do
      expect { subject.top_up 5 }.to change{ subject.balance }.by 5
    end
  end
end
