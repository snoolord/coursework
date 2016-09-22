require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &prc)
    if accumulator.nil?
      accumulator = self.first
      self.delete_at(0)
    end
    i =0
    while i < self.length
      accumulator = prc.call(accumulator,self[i])
      i+=1
    end
    accumulator


  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  i = 2
  while i < num
    return false if num % i == 0
    i+=1
  end
  true
end

def primes(num)
  return [] if num == 0
  i = 3
  primes = [2]
  while primes.length < num
    primes << i if is_prime?(i)
    i+=1
  end
  primes
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  previous_factorials = factorials_rec(num-1)
  next_factorial = [previous_factorials.last * (num-1)]
  previous_factorials + next_factorial
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    number_indexer = Hash.new { |hash, key| hash[key] = [] }
    self.each_with_index do |num, index|
      number_indexer[num] << index
    end
    number_indexer.delete_if { |key,value| value.length <=1}
    number_indexer
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
      substrings = self.substrings
      p substrings
      sym_strings = []
      substrings.each do |string|
        sym_strings << string if string.reverse == string

      end
      p sym_strings
  end

  def substrings
    substrings = []
    0.upto(self.length-1) do |i|
      i+2.upto(self.length-1) do |j|
        substrings << self[i..j]
      end
    end
    substrings.delete_if {|string| string.length <= 1}
    substrings
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    return self if self.length <= 1

    prc ||= Proc.new {|left,right| left<=>right}
    middle_idx = self.length/2
    left = self[0..middle_idx]
    right = self[middle_idx+1..-1]
    debugger
    left = left.merge_sort(&prc)
    right = right.merge_sort(&prc)
    Array.merge(left,right,&prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []
    debugger
    until left.empty? || right.empty?
      case prc.call(left[0],right[0])
      when -1
        merged << left.shift
      else
        merged << right.shift
      end
    end
    merged+left+right

  end
end
