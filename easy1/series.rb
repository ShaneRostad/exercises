# write a program that takes a string of digits and gives you all the possible consecutive number series of length n in that string

# for example:
# - string "01234" has the following 3-digit series:
# - - 012
# - - 123
# - - 234

# and the following 4-digit series
# - 0123
# - 1234


# define a class Series, that is initialized with the length (n)

# slices algorithm:
# - def slices(n) n = length of series
# - split the string into it's chars
# -

class Series
  def initialize(string)
    @string = string
    @length = string.length
  end

  def handle_one(working_array, n)
    output = []
    counter = 0

    until counter + n > @length
      output << [working_array[counter]]
      counter += 1
    end
    output
  end

  def slices(n) # n = length of series
    raise ArgumentError if n > @length
    working_array = @string.split('').map(&:to_i)
    counter = 0
    output = []

    loop do
      return self.handle_one(working_array, n) if n == 1

      output << working_array[counter..counter + n - 1]
      counter += 1
      break if counter + n > @length
    end
    output
  end
end

series = Series.new('01234')
p series.slices(2)
