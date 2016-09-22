class Array
  # Write a method that binary searches an array for a target and returns its
  # index if found. Assume a sorted array

  # NB: YOU MUST WRITE THIS RECURSIVELY (searching half of the array every time).
  # We will not give you points if you visit every element in the array every time
  # you search.

  # For example, given the array [1, 2, 3, 4], you should NOT be checking
  # 1 first, then 2, then 3, then 4.

  def binary_search(target)
    return nil if self.length == 0
    middle_idx = self.length/2
    middle_val = self[middle_idx]
    if middle_val < target
      right = self[middle_idx+1..-1]
      r_search = right.binary_search(target)
      r_search.nil? ? nil : r_search + middle_idx + 1
    elsif middle_val == target
      return middle_idx
    else
      left = self[0...middle_idx]
      left.binary_search(target)
    end

  end
end

class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
    pair_sum = []
    self.each_with_index do |value1,index1|
      self.each_with_index do |value2,index2|
        next if index2 == index1
        if value1+value2 == target
          pair_sum << [index1,index2] unless pair_sum.include?([index1,index2].sort)
        end
      end
    end
    pair_sum
  end
end

# Write a method called 'sum_rec' that
# recursively calculates the sum of an array of values
def sum_rec(nums)
  return 0 if nums.length == 0
  nums.last + sum_rec(nums[0..-2])
end

class String
  # Write a `String#symmetric_substrings` method that returns all
  # substrings which are equal to their reverse image ("abba" ==
  # "abba"). We should only include substrings of length > 1.

  def symmetric_substrings
    substrings = self.substrings
    sym_strings = []
    substrings.each do |string|
      sym_strings << string if string.reverse == string
    end
    sym_strings
  end
  def substrings
    substrings = []
    0.upto(self.length-1) do |i|
      (i+2).upto(self.length-1) do |j|
        substrings << self[i..j]
      end
    end
    substrings
  end
end

def prime?(num)
  return true if num ==2
  i =2
  while i < num
    return false if num % i == 0
    i+=1
  end
  return true
end

# Write a method that sums the first n prime numbers starting with 2.
def sum_n_primes(n)
  return 0 if n == 0
  primes = [2]
  i = 3
  while primes.length < n
    primes << i if prime?(i)
    i+=1
  end
  p primes.inject(:+)
end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i+=1
    end
    self
  end
end

class Array
  # Write a method that returns the first element that causes the passed block
  # to evaluate to `true`
  def my_find(&prc)
    self.my_each do |value|
      return value if prc.call(value)
    end
    nil
  end
end
