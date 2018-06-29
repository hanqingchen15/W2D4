require "byebug"
list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

def my_min_phase_2(arr)
  min = arr[0]
  arr.each {|el| min = el if min > el}
  min
end

def my_min_phase_1(arr)
  min = nil
  arr.each do |el|
    min = el
    arr.each do |el2|
      min = el if min > el2
    end
  end
  min
end

def largest_continuous_subsum_1(arr)
  subarr = []
  i = 0
  while i < arr.length - 1
    j = i + 1
    while j < arr.length
      subarr << arr[i..j]
      j += 1
    end
    i += 1
  end
  max = 0
  subarr.each do |arr|
    sum = 0
    arr.each do |el|
      sum += el
      max = sum if sum > max
    end
  end
  max
end

def largest_continuous_subsum_2(arr)
  max = [nil]
  i = 0
  while i < arr.length - 1
    j = i + 1
    while j < arr.length
      subarr = arr[i..j]
      max = subarr if subarr.reduce(:+) > max.reduce(:+) || max.first == nil
      j += 1
    end
    i += 1
  end
  max.reduce(:+)
end



def largest_subum(arr)
  # byebug
  largest = arr[0]
  current = arr[0]
  idx = 1
  while idx < arr.length
    if current + arr[idx] < 0
      current = 0
    else
      current += arr[idx]
    end
    largest = current if current > largest
    idx += 1
  end
  if largest == 0
    max_neg = arr[0]
    idx = 1
    while idx < arr.length
      if arr[idx] > max_neg
        max_neg = arr[idx]
      end
      idx += 1
    end
    return max_neg
  end
  largest
end




sample = [-5, -1, -3]
p largest_subum(sample)
