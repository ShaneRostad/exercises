# find the primes from 2 up to a given number. Do so by iteratively marking as composite the multiples of each prime, starting with the multiples of 2.

# thinking that we can generate an array of numbers and simply delete the number if it doesn't match the specific criteria we place.

# basically have to do 2 * 1 is_prime? 2*2 is_prime? 2*3 is_prime? and if it is not prime, delete it from our array. Stop iterating through these multiples once 2 * y > limit of range

require 'prime'
require 'pry'

class Sieve
  attr_accessor :working_array, :working_primes, :limit
  def initialize(limit)
    @limit = limit
    @working_array = (2..limit).to_a
    @working_primes = []

    Prime.each(100) do |prime|
      @working_primes << prime
      break if prime * prime > @limit
    end
  end

  def primes
    @working_primes.each do |prime|
      counter = 1
      loop do
        remover = counter * prime
        @working_array.reject! {|num| num == remover && !num.prime? }
        counter += 1
        break if counter * prime > @limit
      end
    end
    @working_array
  end
end
