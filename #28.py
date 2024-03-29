'''
Problem28:
https://leetcode.com/problems/implement-strstr/

Runtime: 26 ms, faster than 59.08% of Python online submissions for Implement strStr().
Memory Usage: 14 MB, less than 50.68% of Python online submissions for Implement strStr().

No clue how to make this faster.
My guess is one would use an incriment that would return the index immediately so line 17 would not need to be performed at all.
'''


class Solution(object):
    def strStr(self, haystack, needle):
        if needle=="":
            return 0 #empty
        elif needle in haystack:
            index = haystack.index(needle)
            return index 
        else:
            return -1 #not found
        
