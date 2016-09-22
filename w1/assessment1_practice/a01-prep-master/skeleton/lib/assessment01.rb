require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &block)
    if accumulator == nil
      accumulator = self[0]
      self.delete_at(0)
    end
    p self[0], accumulator
    i = 0
    while i < self.length
      accumulator = block.call(accumulator, self[i])
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
  counter = 1
  i = 3
  return [2] if num == 1
  return [] if num == 0
  primes = [2]
  until num == counter
    if is_prime?(i)
      primes << i
      counter +=1
    end
    i+=1
  end
  primes

end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  return [] if num == 0
  prev_seq = factorials_rec(num-1)
  prev_seq << factorials(num)
  prev_seq

end

def factorials(num)
  factorial = 1
  (num-1).downto(1) do |n|
    factorial *=n
  end
  factorial
end



class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    duped = Hash.new { |hash, key| hash[key]=[] }
    self.each_with_index do |value,index|
      duped[value] << index
    end
    duped.delete_if {|key,value| value.length == 1}
    duped
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    sym_strings = []

    substrings = substrings(self)
    substrings.delete("")
    substrings = substrings.select {|string| string.length >1}.uniq
    substrings.each do |sub|
      sym_strings << sub if sub == sub.reverse && !sym_strings.include?(sub)
    end
    sym_strings
  end

  def substrings(string)
    sub_strings = []
    0.upto(string.length-1) do |i|
      i+1.upto(string.length-1) do |j|
        sub_strings << string.split('')[i..j].join('')
      end
    end
    sub_strings
  end

end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    return [] if self.length <1
    return self if self.length == 1
    if !block_given?
      prc = Proc.new {|num1,num2| num1<=>num2}
    end
    left = self[0...self.length/2].merge_sort(&prc)
    right = self[self.length/2..-1].merge_sort(&prc)
    p [left, right]
    p Array.merge(left,right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []
    until left.empty? || right.empty?
      if yield(left[0],right[0]) ==  1
        merged << right.shift
      else
        merged << left.shift
      end
    end
    merged + right + left
  end
end
