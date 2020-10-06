require 'oystercard'

describe Oystercard do

  let(:entry_station) {double :station}
  let(:exit_station) {double :station}
  let(:journey) { {entry_station: entry_station, exit_station: exit_station}}

  it 'checks that the oystercard has an initial value of 0' do
    expect(subject.balance).to eq 0
  end

  it 'list of journey is blank by default' do
    expect(subject.journey_history).to be_empty
  end

  describe '#top_up' do

    it 'checks that the top up method can increase the balance' do
      expect { subject.top_up 5 }.to change{ subject.balance }.by 5
    end

    it 'raises error when trying to top up to be more than £90' do
      expect { subject.top_up 91 }.to raise_error('You cannot have more than £90 in your balance')
    end
  end

  describe '#touch_in' do

    it 'raises an error when insufficient balance' do
      expect { subject.touch_in(entry_station) }.to raise_error("Insufficient balance.")
    end

    it 'should store the entry station' do
      subject.top_up(20)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq entry_station
    end

  end

  describe '#touch_out' do
    before do
      subject.top_up(20)
      subject.touch_in(entry_station)
    end

    it 'deducts the fare' do
      expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-Oystercard::MIN_FARE)
    end

    it 'resets the entry_station to nil' do
      subject.touch_out(exit_station)
      expect(subject.entry_station).to eq nil
    end

    it 'creates a journey' do
      subject.touch_out(exit_station)
      expect(subject.journey_history).to include journey
    end

  end

end
