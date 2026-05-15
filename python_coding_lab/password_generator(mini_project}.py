# Password Generator Mini Project
# Generates a random password with user-specified minimum length
# Optionally includes numbers and special characters based on user input
# Returns a password that meets all selected criteria

import random
import string

def generate_password(min_length, numbers=True, sepcial_charcaters=True):
    letters = string.ascii_letters
    digits = string.digits
    special = string.punctuation

    characters = letters
    if numbers:
        characters += digits
    if sepcial_charcaters:
        characters += special
    
    pwd = ""
    meet_criteria = False
    has_number = False
    has_special = False

    while not meet_criteria or len(pwd)<min_length:
        new_char = random.choice(characters)
        pwd += new_char

        if new_char in digits:
            has_number = True
        elif new_char in special:
            has_special = True

        meet_criteria = True
        if numbers:
            meet_criteria = has_number
        if sepcial_charcaters:
            meet_criteria = has_special and meet_criteria
        
    return pwd

min_length = int(input("Enter the minimum length: "))
has_number = input("Do yopu want to have numbers (y/n)?").lower()=="y"
has_special = input("So you want special charcater10s (y/n)?").lower()=="y"
pwd = generate_password(min_length, has_number, has_special)
print("The generated password is: ", pwd)


