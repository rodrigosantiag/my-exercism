module SavingsAccount
  def self.interest_rate(balance)
    if balance < 0
      return 3.213
    elsif balance < 1000
      return 0.5
    elsif balance >= 1000 && balance < 5000
      return 1.621
    else
      return 2.475
    end
  end

  def self.annual_balance_update(balance)
    increase = balance * interest_rate(balance) / 100
    balance + increase
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0

    while current_balance < desired_balance
      current_balance = annual_balance_update(current_balance)
      years += 1
    end

    return years
  end
end
