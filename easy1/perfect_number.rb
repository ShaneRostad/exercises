class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number <= 0
    sum = self.calculate_sum_factors(number)
    if sum == number
      "perfect"
    elsif sum > number
      "abundant"
    else
      "deficient"
    end
  end

  private

  def self.calculate_sum_factors(number)
    counter = 1
    divisors = []
    while counter < number
      divisors << counter if number % counter == 0
      counter += 1
    end
    divisors.inject(&:+)
  end
end

p PerfectNumber.classify(28)
