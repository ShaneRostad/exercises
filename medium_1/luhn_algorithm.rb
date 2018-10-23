class Luhn
  attr_accessor :number

  def initialize(integer)
    @number = integer
  end

  def self.create(integer)
    luhn_number = Luhn.new(integer)
    return luhn_number.number if luhn_number.valid?

    luhn_number.number = "#{luhn_number.number}0".to_i
    until luhn_number.valid?
      luhn_number.number += 1
    end
    luhn_number.number
  end

  def addends
    ends = []

    @number.digits.each_with_index do |num, idx|
      if num * 2 < 10 && idx.odd?
        ends << num * 2
      elsif num * 2 >= 10 && idx.odd?
        ends << num * 2 - 9
      else
        ends << num
      end
    end
    ends.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end
end
luhn = Luhn.new(12_121)
p luhn.addends
