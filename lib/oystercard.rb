class Oystercard

  MAXIMUM_BALANCE = 90
  MIN = 1

  attr_reader :balance, :in_journey

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
    @in_journey
  end

  def touch_in
    fail "You don't have enough money" if balance < MIN
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
