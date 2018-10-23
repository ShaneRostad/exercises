# write a program that will take a decimal number, and convert it to the appropriate sequence of events for a secret handshake.

# There are 10 types of people in the world: Those who understand binary, and those who don't. You and your fellow cohort of those inthe "know" when it comes to binary decide to come up with a secret "handshake".

# 1 = wink | binary value: 1
# 10 = double blink | binary value: 2
# 100 = close your eyes | binary value: 4
# 1000 = jump | binary value: 8

# 10000 = Reverse the order of the operations in the next secret handshake.
# - Binary value: 16

# input: A number represented as a binary string or an integer.
# output: an array of commands in the specified order
# rules: if string.includes? letters

# algorithm:
# 1 - take an integer or a string
# 2 - call to_i on the number (This will only work for "1", not any binary string)
# 3 -
class SecretHandshake
  POSSIBLE_COMMANDS = ["wink", "double blink", "close your eyes", "jump",
                       "reverse"]

  def initialize(number)
    @binary = calculate_binary(number)
  end

  def calculate_binary(number)
    if number.instance_of?(String)
      return number if valid_binary?(number)
      0
    elsif number.instance_of?(Integer)
      change_to_binary(number)
    end
  end

  def change_to_binary(integer)
    binary_string = ''
    loop do
      if integer % 2 == 1
        binary_string << '1'
      else
        binary_string << '0'
      end
      integer = integer / 2
      break if integer < 1
    end
    binary_string.reverse
  end

  def valid_binary?(string)
    !string.match(/[^01]/)
  end

  def commands
    handshake = []
    counter = 1
    return handshake if @binary == 0

    loop do
      break handshake.reverse! if POSSIBLE_COMMANDS[counter - 1] == "reverse"

      if @binary[-counter] == '1'
        handshake << POSSIBLE_COMMANDS[counter - 1]
      end

      counter += 1
      break if counter > @binary.length
    end
    handshake
  end
end

cool_handshake = SecretHandshake.new("hello")
p cool_handshake.commands
