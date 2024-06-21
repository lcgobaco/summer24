// Name: Lucas Gobaco
// Date: 10 June 2024
// Program Name: Programming Project 1
// Program Description: This program prompts the user to input a hexadecimal number and then outputs the decimal equivalent.

#include <iostream>
#include <string>
#include <cmath>

using namespace std;

int hexToDec(string hex);

int main() {
    // prompt user for hexadecimal number input
    string hex;
    cout << "Enter a hexadecimal number (uppercase letters only): ";
    cin >> hex;

    // output decimal equivalent
    cout << "The decimal equivalent of your number is: " << hexToDec(hex) << endl;

    return 0;
}

/**
 * Takes a hexadecimal number as input and returns its decimal equivalent.
 * @param hex The hexadecimal number to convert to decimal.
 * @return The decimal equivalent of the hexadecimal number.
 */
int hexToDec(string hex) {
    // initialize variables for decimal equivalent and power of 16 for current digit
    int decimal = 0;
    int power = 0;

    // iterate through the string containing the hexadecimal number from right to left
    for (int i = hex.length() - 1; i >= 0; i--) {
        int num;
        // if the current digit is a number, use as is
        if (hex[i] >= '0' && hex[i] <= '9')
            num = hex[i] - '0';
        // else if the digit is a letter, convert to decimal equivalent
        else 
            num = hex[i] - 'A' + 10;
        // add the decimal equivalent of the current digit to the total
        decimal += num * pow(16, power);
        power++;
    }

    return decimal;
}