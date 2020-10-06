require 'station'

describe Station do

  let(:subject) {Station.new('Picadilly', 1)}

  it 'should allow the name of the station to be passed in on creation' do
    expect(subject.name).to eq 'Picadilly'
  end

  it 'should allow the zone of the station to be passed in on creation' do
    expect(subject.zone).to eq 1
  end

end
