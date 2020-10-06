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

    it 'raises error when trying to top up to be more than £90' do
      expect { subject.top_up 91 }.to raise_error('You cannot have more than £90 in your balance')
    end
  end

  describe '#in_journey?' do
    it { is_expected.to respond_to(:in_journey?) }

    it 'return false by default' do
      expect(subject.in_journey?).to eq false
    end
  end

  describe '#touch_in' do
    it { is_expected.to respond_to(:touch_in) }

    it 'returns in_journey as true' do
      subject.top_up(20)
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it 'raises an error when insufficient balance' do
      expect { subject.touch_in }.to raise_error("Insufficient balance.")
    end

  end

  describe '#touch_out' do
    it { is_expected.to respond_to(:touch_out) }

    before do
      subject.top_up(20)
      subject.touch_in
    end

    it 'returns in_journey as false' do
      subject.touch_out
      expect(subject).not_to be_in_journey
    end

    it 'deducts the fare' do
      expect { subject.touch_out }.to change { subject.balance }.by(-Oystercard::MIN_FARE)
    end
  end

end
