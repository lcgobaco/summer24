// Name: Lucas Gobaco
// Date: 12 June 2024
// Program Name: Programming Project 2
// Program Description: This program prompts the user to input a positive integer and prints it one digit at a time.

#include <iostream>

using namespace std;

void printIntDigits(int num);

int main() 
{
    // prompt user to enter a positive integer
    int num;
    cout << "Enter a positive integer: ";
    cin >> num;

    printIntDigits(num);

    return 0;
}

/**
 * Takes a positive integer as input and prints each digit of the integer one at a time.
 * @param num The positive integer to print the digits of.
 */
void printIntDigits(int num) 
{
    int digit;
    bool lastDigitZero = false;

    // find largest digit of integer
    int temp = 10;
    while (temp < num)
        temp *= 10;

    // checks if last digit is zero
    if (num % 10 == 0)
        lastDigitZero = true;

    // output each digit of the integer one at a time
    cout << "The digits of your integer are: " << endl;
    while (num > 0) 
    {
        temp /= 10;
        digit = num / temp;
        cout << digit << endl;
        num %= temp;
    }

    // prints a zero if last digit is zero
    if (lastDigitZero)
        cout << "0" << endl;
}