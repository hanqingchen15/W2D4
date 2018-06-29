def first_anagram?(string, string2)
  string_array = string.split("")
  string_array_permutations = string_array.permutation.to_a
  string_array_permutations.map! do |perm|
    perm.join("")
  end
  string_array_permutations.each {|permutations| return true if permutations == string2}
  false
end

def second_anagram?(str, str2)
  arr = str.split("")
  arr.each_with_index do |el, i|
    if str2.include?(el)
      str.slice!(el)
      str2.slice!(el)
    end
  end
  return true if str.empty? && str2.empty?
  false
end


def third_anagram?(str, str2)
  str.split("").sort == str2.split("").sort
end

def fourth_anagram?(str, str2)
  hash1 = Hash.new(0)
  str.each_char do |ch|
    hash1[ch] += 1
  end
  str2.each_char do |ch|
    hash1[ch] -= 1
  end
  hash1.values.none? { |count| count > 0}
end



p fourth_anagram?("abcdefghijklmnopqrstuvwxyz", "abcdefghijklmnopqurstvwxyz")
