# Write a program to find the sum of numbers from 1 to 10
totals = 0 
for i in range(0,11):
    totals += i
print(totals)

# Count Vowels in a String
String = str(input("Type any word to count Vowles in given:")).lower()
vowels = ("a","e","i","o","u")
count = 0
for i in String:
    if i in vowels:
        count+=1
print(count)

# Find the largest number in a list.
num = [10, 20, 23, 50, 88, 11]
largest = num[0]
for i in num:
    if i > largest:
        largest = i
print(largest)