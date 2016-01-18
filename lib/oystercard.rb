class Oystercard

  MAXIMUM_BALANCE = 90
  MIN = 1
  MINIMUM_CHARGE = 2

  attr_reader :balance, :in_journey, :entry_station

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Maximum balance exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    !!ent
  end

  def touch_in(station)
    fail "You don't have enough money" if balance < MIN
    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @entry_station = nil
    @in_journey = false
  end
end
