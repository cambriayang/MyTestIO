import sys
import math
import array

class Sort():
    def run(self, str):
        print(str)

    def buble(self, items):
        array = items

        i = 0
        while i < len(array) - 1:
            j = len(array) - 1

            while j > i:
                if array[j] < array[j-1]:
                    tmp = array[j]
                    array[j] = array[j-1]
                    array[j-1] = tmp

                j = j - 1

            i = i + 1

        print(array)


class Solution():
    def isPalindrome(self, number):
        if number < 0:
            return False
        elif number == 0:
            return True
        else:
            tmp = number
            y = 0

            while number != 0:
                y = y*10 + number%10
                number = math.floor(number/10)

            if y == tmp:
                return True
            else:
                return False



if __name__ == "__main__":
    app = Sort()
    app.run("Hello World!")
    app.buble([1,5,5,2,2,3,6,79,19,22,-1,-2,0])

    app = Solution()

    if app.isPalindrome(1234554321):
        print("\nisPalindrome")
    else:
        print("\nnot Palindrome")