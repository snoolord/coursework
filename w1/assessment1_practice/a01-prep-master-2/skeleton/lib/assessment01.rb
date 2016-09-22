require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &blk)
    if accumulator == nil
      accumulator = self[0]
      self.delete_at(0)
    end
    i =0
    while i < self.length
      accumulator = blk.call(accumulator,self[i])
      i+=1
    end
    p accumulator

  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  i = 2
  while i < num
    if num % i == 0
      return false
    end
    i+=1
  end
  return true
end

def primes(num)
  return [] if num == 0
  return [2] if num == 1
  primes = [2]
  i = 3
  counter = 1
  while counter < num
    if is_prime?(i)
      primes << i
      counter+=1
    end
    i+=1
  end
  primes
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 0
  return [1] if num == 1
  prev_factorials = factorials_rec(num-1)
  next_factorial = [prev_factorials.last * (num-1)]
  prev_factorials + next_factorial
end


class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    num_counter = Hash.new { |hash, key| hash[key] = []  }
    self.each_with_index do |value, index|
      num_counter[value] << index
    end
    num_counter.delete_if {|key,value| value.length == 1}
    num_counter
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    strings = []
    self.substrings.each do |substring|
      strings << substring if substring == substring.reverse
    end
    strings
  end
  def substrings
    substrings = []
    string_array = self.split('')
    0.upto(string_array.length-1) do |i|
      i+1.upto(string_array.length-1) do |j|
        substrings << string_array[i..j] unless substrings.include?(string_array[i..j]) || string_array[i..j] == nil
      end
    end
    substrings.map! do |array|
      array.join('')
    end
    substrings.delete_if {|substring| substring.length <=1}
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    return [] if self.length == 0
    return self if self.length == 1
    middle_idx = self.length/2
    if prc.nil?
      prc = Proc.new {|num1,num2| num1 <=> num2}
    end
    left = self[0..middle_idx-1]
    right = self[middle_idx..-1]
    left = left.merge_sort(&prc)
    right = right.merge_sort(&prc)
    Array.merge(left,right,&prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      case prc.call(left[0],right[0])
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end
    p merged + left + right
  end
end
