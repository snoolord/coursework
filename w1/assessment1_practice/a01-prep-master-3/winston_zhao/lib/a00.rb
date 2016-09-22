# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  alphabet = ("a".."z").to_a
  words = str.split(' ')
  words = words.map do |word|
    word.split('').map do |letter|
      p letter
      letter = alphabet[(alphabet.index(letter)+shift)%26]
    end
  end
  words = words.map do |array|
    array.join('')
  end
  p words.join(' ')
end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)
  until num <10
    num = digit_summer(num)
  end
  num
end
def digit_summer(num)
  sum = 0
  until num == 0
    sum += num%10
    num = num/10
  end
  sum
end



# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  if alphabet.nil?
    return str.split('').sort.join('')
  end
  solution = []
  letters = str.split('')
  letter_holder = Hash.new(0)
  letters.each do |letter|
    letter_holder[letter] = alphabet.index(letter)
  end
  letter_holder.sort_by { |key,value| value}.each do |number|
    1.upto(letters.count(number[0])) do
      solution << number[0]
    end
  end
  solution.join('')

end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    two_sum = []
    self.each_with_index do |num1,idx1|
      self.each_with_index do |num2,idx2|
        next if idx1 == idx2
          if num1 + num2 == 0
            p num1, num2
            p [idx1,idx2]
            two_sum << [idx1,idx2] unless two_sum.include?([idx1,idx2].sort)
          end
      end
    end
    two_sum
  end
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    real_words = []
    dictionary.each do |word|
        real_words << word if self.include?(word)
    end
    real_words
  end

end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  factors = []
  1.upto(num) do |numb|
    factors << numb if divisible(num,numb)
  end
  factors
end

def divisible(num, divisor)
  if num%divisor == 0
    return divisor
  end

end
