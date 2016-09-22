def range_recursive(start,ender)
  return [] if start == ender-1
  array = [start+1]
  array += range(start+1,ender)
end

def range_iterative(start,ender)
  array = []
  (start+1).upto(ender-1) do |num|
    array << num
  end
  array
end

def exp1(b,n)
  return 1 if n == 0
  b * exp1(b,n-1)
end

def exp2(b,n)
  return 1 if n == 1
  p n
  if n.odd?
    b * (exp2(b,(n-1)/2)*exp2(b,(n-1)/2))
  else
    exp2(b,n/2)*exp2(b,n/2)
  end

end

def deep_dup(array)
  new_array = []
  array.each do |el|
    if el.is_a?(Array)
      new_array << deep_dup(el)
    else
      new_array << el
    end
  end
  new_array
end

def itr_fibonacci(n)
  return nil if n <1
  return 1 if n <=2
  sequence = [1,1]
  until sequence.length == n
    sequence << sequence[-1] + sequence[-2]
  end
  sequence.last
end


def rec_fibonnaci(n)
  return nil if n <1
  return [1] if n == 1
  return [1,1] if n == 2
  prev_seq = rec_fibonnaci(n-1)
  prev_seq << prev_seq.last(2).inject(:+)
end

def binary_search(array,target)
  middle_idx = array.length/2
  return nil if array.length == 0
  return middle_idx if target == array[middle_idx]
  if target > array[middle_idx]
    right_search = binary_search(array[array.length/2+1..-1],target)
    if right_search == nil
      return nil
    else
      right_search + middle_idx + 1
    end
  else
    binary_search(array[0...array.length/2],target)
  end
end

def merge_sort(array)
  return nil if array.length <1
  return array if array.length == 1
  left = merge_sort(array[0...array.length/2])
  right = merge_sort(array[array.length/2..-1])
  merge(left,right)
end

def merge(arr1,arr2)
  merged = []
  until arr1.empty? && arr2.empty?
    if arr1.empty?
      merged << arr2.shift
    elsif arr2.empty?
      merged << arr1.shift
    elsif arr1[0] < arr2[0] || arr1[0] == arr2[0]
      merged << arr1.shift
    elsif arr1[0] > arr2[0]
      merged << arr2.shift
    end
  end
  merged
end

def subsets(array)
  return [[]] if array == []
  prev_subset = subsets(array[0..-2])
  new_subset = []
  prev_subset.each do |subset|
    new_subset << subset + [array[-1]]
  end
  prev_subset + new_subset
end

def greedy_make_change(amount,coin_array=[25,10,5,1])
  return [] if amount == 0
  coins = []
  coin_count = amount / coin_array[0]
  coin_count.times do
    coins << coin_array[0]
  end
  total_amount = coin_count * coin_array.shift
  coins += greedy_make_change(amount-total_amount,coin_array)
  coins
end

def make_better_change(amount, coin_array=[25,10,5,1])
  return [] if amount == 0
  best_coins = nil
  coin_array = coin_array.select {|coin| coin <= amount}
  coin_array.each do |coin|
    curr_amount = amount - coin
    curr_coins = [coin] + make_better_change(curr_amount,coin_array)
    if best_coins.nil? || curr_coins.length < best_coins.length
      best_coins = curr_coins
    end
  end
  best_coins
end
