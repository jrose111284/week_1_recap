require 'oystercard'
describe Oystercard do
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

    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'deducts money from balance' do
      subject.deduct(2.00)
      expect{ subject.deduct 2 }.to change { subject.balance }.by (-2)

    end
  end
end
