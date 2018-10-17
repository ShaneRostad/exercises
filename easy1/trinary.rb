# a trinary number represented as a string to its decimal equivalent

# trinary numbers can only contain three symbols: 0, 1, 2

# the last place in a trinary is the 1's place, the second to last is the 3's place, the third to last is the 9's place, etc


# trinary(n)
# trinary_array = n.digits.reverse
# counter = 1
# loop do
# check if valid trinary
# - container << trinary_array[-counter] * (3**counter)
# - counter *= 3
# end
# container.reduce(:+)

class Trinary
  def initialize(trinary_num)
    @num = trinary_num
    @trinary_array = trinary_num.to_i.digits.reverse
  end

  def invalid?
    @num == 0
  end

  def to_decimal
    counter = 1
    trinary_mult = 1
    container = []
    return 0 if invalid?
    
    loop do
      container << @trinary_array[-counter] * (trinary_mult)
      trinary_mult *= 3
      counter += 1
      break if counter > @trinary_array.size
    end
    container.inject(:+)
  end
end
