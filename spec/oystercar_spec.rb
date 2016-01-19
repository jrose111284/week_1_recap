require 'oystercard'
describe Oystercard do
  let(:station) { double :station }
  let(:entry_station) {double :station }

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect{ subject.top_up 1 }.to change { subject.balance }.by (1)
    end

    it 'raises an error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up maximum_balance
      expect{ subject.top_up 1 }.to raise_error "Maximum balance exceeded"
    end

    it "can touch in" do
      subject.top_up(20)
      subject.touch_in(entry_station)
      expect(subject).to be_in_journey
    end

    it "can deduct fare" do
      subject.top_up(20)
      subject.touch_in(station)
      expect{ subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MINIMUM_CHARGE)

    end

    it 'will not touch in if below minimum balance' do
      expect{ subject.touch_in(station) }.to raise_error "You don't have enough money"
    end

    it "stores a entry station" do
      subject.top_up(20)
      subject.touch_in(station)
      # expect(station.entry_station).to eq station
    end
  end
end
