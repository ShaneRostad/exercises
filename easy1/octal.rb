# implement octal to decimal conversion. Given an octal input string, your program should produce a decimal output.

# note: implement the conversion yourself. Do not use seomthing else to perform the conversion. Treat invalid input as octal 0.

# about octal (base-8):

#decimal is a base-10 system

# a number 233 in base 10 notation can be understood as a linear combination of powers of 10

# the rightmost digit gets multiplied by 10^0 = 1
# the next number gets multiplied by 10^1 = 10
# ...
# the n*th number gets multiplied by 10^n-1*
# all these values are summed.

#so

# 233 # decimal
# = 2*10^2 + 3*10^1 + 3*10^0
# = 2*100  + 3*10   + 3*1

# octal is similar, but uses powers of 8 rather than powers of 10. So:
#233 # octal
# = 2*8^2 + 3*8^1 + 3*8^0
# = 2*64  + 3*8   + 3*1
# = 128   + 24    + 3
# = 155

# = 155

# +1 - 1 - x8 - 8
# +5 - 13 x8 - 104
# +5 - 109

# octal(n) n = number to convert
# number_of_digits = n
# counter = 1
# loop do
#  - n.digits.reverse[counter - 1]^(n - counter)
#  - counter += 1
#  - break if counter > number_of_digits
# end

# octal(n) n = number to convert
# sum = 0
# n.digits.reverse.each do |digit|
# - sum += digit
# - if n.digit.reverse.last = digit
# - - return sum
# - else
# - - sum *= 8
# - end


require 'pry'


class Octal
  def initialize(num)
    @n = num.to_i
    @array_of_digits = @n.digits.reverse
  end

  def invalid?
    @array_of_digits.any? {|e| e > 7 } || @n == 0
  end

  def to_decimal
    sum = 0
    counter = 1
    return sum if invalid?
    @array_of_digits.each do |digit|
      sum += digit
      counter += 1
      return sum if counter > @array_of_digits.size
      sum *= 8
    end
  end
end



#
#
#
#
#
#
#

#
#
#
