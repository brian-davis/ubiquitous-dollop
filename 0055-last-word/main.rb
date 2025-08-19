# 58. Length of Last Word
# Easy
# Topics
# Companies
# Given a string s consisting of words and spaces, return the length of the last word in the string.

# A word is a maximal substring consisting of non-space characters only.


# @param {String} s
# @return {Integer}
def length_of_last_word(s)
  s.split(/\W/).last.length
end

# Example 1:
# Input: s = "Hello World"
# Output: 5
# Explanation: The last word is "World" with length 5.
e1 = "Hello World"
p length_of_last_word(e1)

# Example 2:
# Input: s = "   fly me   to   the moon  "
# Output: 4
# Explanation: The last word is "moon" with length 4.
e2 = "   fly me   to   the moon  "
p length_of_last_word(e2)

# Example 3:
# Input: s = "luffy is still joyboy"
# Output: 6
# Explanation: The last word is "joyboy" with length 6.
e3 = "luffy is still joyboy"
p length_of_last_word(e3)


# Constraints:
# 1 <= s.length <= 104
# s consists of only English letters and spaces ' '.
# There will be at least one word in s.