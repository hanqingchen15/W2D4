def bad_sum(arr, target = 0)
  i = 0
  while i < arr.length - 1
    j = i + 1
    while j < arr.length
      return true if arr[i] + arr[j] == target
      j += 1
    end
  i += 1
  end
  false
end

# O(n2)

arr = [0, 1, 5, 7]



def okay_sum(arr, target)
  arr.sort!
  arr.each_with_index do |el, idx|
    subtarget = target - el

    if bsearch(arr, subtarget).nil? == false && bsearch(arr, subtarget) != idx
      return true
    end
  end
  false
end


def bsearch(arr, target)
  return nil if arr.length == 0
  mid = arr.length / 2
  case target <=> arr[mid]
  when 0
    return mid
  when 1
    return bsearch(arr[0...mid], target)
  when -1
    bsearch_res = bsearch(arr[mid+ 1..-1], target)
    bsearch_res.nil? ? nil : bsearch_res + mid + 1
  end
end
#
# def bsearch(arr, target)
#   middle = arr.length / 2
#   i = 0
#   j = arr.length - 1
#
#   while i < j
#     if arr[middle] == target
#       return true
#     elsif arr[middle] < target
#       i = middle + 1
#       middle = i + j / 2
#     else
#       j = middle - 1
#       middle = i + j / 2
#     end
#   end
#   false
# end


p okay_sum(arr, 10)
p okay_sum(arr, 6)
