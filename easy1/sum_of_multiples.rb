# write a program that, given a number, can find the sum of all the multiples of particular numbers up to but not including that number

# If we list all the natural numbers up to but not including 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, 19

# the sum of these multiples is 78

# write a program that can find the sum of the multiples of a given set of numbers. If no set of numbers is given, default to 3 and 5.

class SumOfMultiples
  attr_accessor :multipliers
  def initialize(first=3, second=5, *third)
    @multipliers = [first, second, *third]
  end

  def self.to(n)
    range = (1..n-1).to_a
    return 0 if range.all? { |e| n < e }
    
    object = range.each_with_object([]) { |num, obj|
      obj << num if [3, 5].any? { |e| num % e == 0 }
      }.inject(&:+)

  end

  def to(n)
    range = (1..n-1).to_a
    return 0 if range.all? { |e| n < e }

    object = range.each_with_object([]) { |num, obj|
      obj << num if @multipliers.any? { |e| num % e == 0 }
      }.inject(&:+)

  end
end
