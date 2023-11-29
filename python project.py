# Example 1
# Calculate the multiplication and sum of two numbers
num1 = int(input("Enter first number: "))
num2 = int(input("Enter second number: "))

product = num1 * num2

if product <= 1000:
    print("Product is greater than or equal to 1000:", product)
else:
    print("Sum of the two numbers:", num1 + num2)
    
# Example 2
# Remove first 'n' characters from a string 
def remove_chars(word, n):
    print('Original string:', word)
    x = word[n:]
    return x

print("Removing characters from a string")
word = input("Enter your word: ")
print(remove_chars(word, 4))
print(remove_chars(word, 2))

# Example 3
# Friend activity timers
friends = ["Rolf", "Jane", "Anne", "Sarah", "Carolene"]
Last_seen = ["3:00", "12:00", "7:00", "5:00", "6:00"]

# Combine the two lists into a dictionary using zip
timers = dict(zip(friends, Last_seen))

print(timers)

def multiply():
    num1, num2 = map(int, input("Enter 2 numbers: ").split(','))
    results = num1 * num2
    return results

print(multiply())

# Example 4
# Print out numbers from 1 to 100 (including 100).
# But, instead of printing multiples of 3, print "Fizz"
# Instead of printing multiples of 5, print "Buzz"
# Instead of printing multiples of both 3 and 5, print "FizzBuzz".

for numbers in range(1, 101):
    if numbers % 3 == 0:
        print("Fizz")
    elif numbers % 5 == 0:
        print("Buzz")
    elif numbers % 3 == 0 and numbers % 5 == 0:
        print("FizzBuzz")
    else:
        print(numbers)
        
# Example 5
# random magic ball predictions 
import random

question = input("Ask me any question you like: ")
random_number = random.randint(1, 9)


answers_dict = {
    1: "Yes - definitely",
    2: "As the moon waxes, so shall your fortunes grow.",
    3: "Without a doubt",
    4: "The magic ball is on vacation from answering silly questions. Come back later!",
    5: "The stars are too busy laughing at your question to provide a serious answer.",
    6: "Is the sky blue? Ask again when pigs fly!",
    7: "My sources say no",
    8: "Even Cupid is scratching his head at your question. Life is mysterious, after all!",
    9: "Very doubtful",
}

# Check if random_number is within the range of the dictionary keys
if 1 <= random_number <= 9:
    answer = answers_dict[random_number]
else:
    answer = "Error"

print(answer)

# Example 6
# Expense tracker program 
# User's Budget: Allow the user to set an initial budget for their expenses. 
def deposit():
    while True:
        amount = input("What would you like to deposit? $")
        if amount.isdigit():
            amount = int(amount)
            if amount > 0:
                break
            else:
                print("Amount must be greater than 0")
        else:
            print("Please enter a number.")
    return amount

# Add Expenses: Feature that lets users to add their daily expenses within their category. 
def expense_by_category():
    total = 0

    for category in range(3):
        expense_category = input("Enter expense category: ") 
        amount_spent = float(input(f"How much did you spend for {expense_category}?: "))
        total += amount_spent

    print(f"Total spending amount: {total}")
    return total

# Main function
def main():
    balances = deposit()
    expenses = expense_by_category()

    if expenses > balances:
        print("Your budget is exceeded!")
    else:
        print("Your budget is within limits!")

    current_savings = balances - expenses
    if current_savings > 0:
        print(f"Your savings is {current_savings}")
    else:
        print("Insufficient Balance! Savings are low.")
main ()
