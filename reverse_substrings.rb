# Reverse Substrings Between Each Pair of Parentheses
# You are given a string s that consists of lower case English letters and brackets.
#
#   Reverse the strings in each pair of matching parentheses, starting from the innermost one.
#
#   Your result should not contain any brackets.

#   Example 1:
#
#   Input: s = "(abcd)"
# Output: "dcba"
# Example 2:
#
#   Input: s = "(u(love)i)"
# Output: "iloveu"
# Explanation: The substring "love" is reversed first, then the whole string is reversed.
#   Example 3:
#
#   Input: s = "(ed(et(oc))el)"
# Output: "leetcode"
# Explanation: First, we reverse the substring "oc", then "etco", and finally, the whole string.
#
#
#     Constraints:
#
#   1 <= s.length <= 2000
# s only contains lower case English characters and parentheses.
#   It is guaranteed that all parentheses are balanced.

def reverse_parentheses(s)
    @open_brace = []
    @close_brace = []
    @str = s
    @str.gsub!('()', '')
    @hash = {}
    find_index(0)
    s.include?('(') ? output_string : s
end

def find_index(i)
   k = 0
   return if i == @str.length

   if @str[i] == '('
     @hash["key:#{i}"] = [i]
     @open_brace.push(i) 
   end
   if @str[i] == ')'
     match_pair_bracket(i)
     @close_brace.push(i)
   end

   find_index(i+1)
end

def match_pair_bracket(i)
   ele = @open_brace.pop()
   @hash["key:#{ele}"].push(i)
end

def output_string
   @hash.reverse_each.with_index do |key, val|
      k = key.last[0]
      l = key.last[1]
      if l - k <= 2
        next
      end
      med = (k + l) / 2
      while k <= med
        temp = @str[k]
        @str[k] = @str[l]
        @str[l] = temp

        k = k + 1
        l = l - 1
       end
   end
   
   @str.gsub!(')', '')
   @str.gsub!('(', '')
end
