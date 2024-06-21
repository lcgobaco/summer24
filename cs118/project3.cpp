// Name: Lucas Gobaco
// Date: 17 June 2024
// Program Name: Programming Project 3
// Program Description: This program manages a stack, being able to push values onto the stack, pop the top value from the stack, and peek at the top value of the stack.

#include <iostream>

using namespace std;

class Stack {
    private:
        /**
         * The array that stores the stack.
         */
        int* stackArray;

        /**
         * The size of the stack.
         */
        int stackSize;

        /**
         * The index of the top of the stack.
         */
        int top;
    public:
        /**
         * Creates an empty stack with the specified size.
         * @param size The size of the stack.
         */
        Stack(int size);

        /**
         * Destructor for the stack.
         */
        ~Stack();

        /**
         * Pushes a value to the top of the stack.
         * @param value The value to push to the stack.
         */
        void push(int value);

        /**
         * Pops the value from the top of the stack.
         */
        void pop();

        /**
         * Returns the value at the top of the stack.
         * @return The value at the top of the stack.
         */
        int peek();
};

/**
 * Creates an empty stack with the specified size.
 * @param size The size of the stack.
 */
Stack::Stack(int size) {
    stackSize = size;
    stackArray = new int[stackSize];
    top = -1;
}

/**
 * Destructor for the stack.
 */
Stack::~Stack() {
    delete[] stackArray;
}

/**
 * Pushes a value to the top of the stack.
 * @param value The value to push to the stack.
 */
void Stack::push(int value) {
    // if stack is not full increment top and add the value to the stack (stack is full if top is stackSize - 1)
    if (top != stackSize - 1)
        stackArray[++top] = value;
}

/**
 * Pops the value from the top of the stack.
 */
void Stack::pop() {
    // if stack is not empty then decrement top to make the (stack is empty if top is -1) 
    if (top != -1)
        top--;
}

/**
 * Returns the value at the top of the stack.
 * @return The value at the top of the stack.
 */
int Stack::peek() {
    // returns -1 to indicate an empty stack
    if (top == -1) {
        return -1;
    }
    // if stack is not empty then return top element
    return stackArray[top];
}

int main() {
    // create stack with size 5
    Stack stack(5);

    // push 5 values into stack
    stack.push(10);
    stack.push(20);
    stack.push(30);
    stack.push(40);
    stack.push(50);

    // stack is full, top of stack should still be 50
    stack.push(60);

    // checks current top of stack, should be 50
    cout << "Top of stack: " << stack.peek() << endl;

    // pop 2 values from stack
    stack.pop();
    stack.pop();

    // checks current top of stack, should be 30
    cout << "Top of stack: " << stack.peek() << endl;

    // pop 3 values from stack
    stack.pop();
    stack.pop();
    stack.pop();

    // stack is empty, should return -1
    cout << "Top of stack: " << stack.peek() << endl;

    return 0;
}