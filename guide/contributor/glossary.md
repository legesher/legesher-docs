# glossary

## Glossary 📖

For all the words that would be of benefit to know. If there is a word you believe should be on this list, please open an `issue`.

- [Keywords](https://docs.legesher.io/legesher-docs/glossary#keywords)
  - [Truth Values](https://docs.legesher.io/legesher-docs/glossary#truth-values)
    - [`True`](https://docs.legesher.io/legesher-docs/glossary#true)
    - [`False`](https://docs.legesher.io/legesher-docs/glossary#false)
  - [Logical Operators](https://docs.legesher.io/legesher-docs/glossary#logical-operators)
    - [`and`](https://docs.legesher.io/legesher-docs/glossary#and)
    - [`not`](https://docs.legesher.io/legesher-docs/glossary#not)
    - [`or`](https://docs.legesher.io/legesher-docs/glossary#or)
  - [Loops](https://docs.legesher.io/legesher-docs/glossary#loops)
    - [`for`](https://docs.legesher.io/legesher-docs/glossary#for)
    - [`in`](https://docs.legesher.io/legesher-docs/glossary#in)
    - [`while`](https://docs.legesher.io/legesher-docs/glossary#while)
    - [`if`](https://docs.legesher.io/legesher-docs/glossary#if)
    - [`elif`](https://docs.legesher.io/legesher-docs/glossary#elif)
    - [`else`](https://docs.legesher.io/legesher-docs/glossary#else)
    - [`break`](https://docs.legesher.io/legesher-docs/glossary#break)
    - [`continue`](https://docs.legesher.io/legesher-docs/glossary#continue)
  - [User Defined Structures](https://docs.legesher.io/legesher-docs/glossary#user-defined-structures)
    - [`class`](https://docs.legesher.io/legesher-docs/glossary#class)
    - [`def`](https://docs.legesher.io/legesher-docs/glossary#def)
    - [`async`](https://docs.legesher.io/legesher-docs/glossary#async)
    - [`await`](https://docs.legesher.io/legesher-docs/glossary#await)
  - [References](https://docs.legesher.io/legesher-docs/glossary#references)
    - [`del`](https://docs.legesher.io/legesher-docs/glossary#del)
    - [`as`](https://docs.legesher.io/legesher-docs/glossary#as)
    - [`is`](https://docs.legesher.io/legesher-docs/glossary#is)
    - [`none`](https://docs.legesher.io/legesher-docs/glossary#none)
  - [Exceptions](https://docs.legesher.io/legesher-docs/glossary#exceptions)
    - [`except`](https://docs.legesher.io/legesher-docs/glossary#except)
    - [`try`](https://docs.legesher.io/legesher-docs/glossary#try)
    - [`raise`](https://docs.legesher.io/legesher-docs/glossary#raise)
    - [`finally`](https://docs.legesher.io/legesher-docs/glossary#finally)
  - [Module Abstractions](https://docs.legesher.io/legesher-docs/glossary#module-abstractions)
    - [`from`](https://docs.legesher.io/legesher-docs/glossary#from)
    - [`import`](https://docs.legesher.io/legesher-docs/glossary#import)
  - [Variable Declarations](https://docs.legesher.io/legesher-docs/glossary#variable-declarations)
    - [`global`](https://docs.legesher.io/legesher-docs/glossary#global)
    - [`lambda`](https://docs.legesher.io/legesher-docs/glossary#lambda)
    - [`nonlocal`](https://docs.legesher.io/legesher-docs/glossary#nonlocal)
  - [Function Properties](https://docs.legesher.io/legesher-docs/glossary#function-properties)
    - [`pass`](https://docs.legesher.io/legesher-docs/glossary#pass)
    - [`return`](https://docs.legesher.io/legesher-docs/glossary#return)
    - [`with`](https://docs.legesher.io/legesher-docs/glossary#with)
    - [`yield`](https://docs.legesher.io/legesher-docs/glossary#yield)
  - [Debugging](https://docs.legesher.io/legesher-docs/glossary#debugging)
    - [`assert`](https://docs.legesher.io/legesher-docs/glossary#assert)

## Keywords 🔑

`Keywords` in programming languages are specific words that are reserved to communicate specific things to the computer. These words remain consistent across all uses of the programming language.

### Truth Values

_Truth values_ are the results of comparison operations or logical \(Boolean\) operations.

#### `True`

- **Definition**: similar to "1", and considered **TRUE** in boolean logic

#### `False`

- **Definition**: similar to "0", and considered **FALSE** in boolean logic

### Logical Operators

The other logical operators. Each operator has their own truth table:

#### `and`

- **Definition**: will result into `True` only if both the operands are `True`

#### `not`

- **Definition**: used to invert the truth value

#### `or`

- **Definition**: will result into `True` if any the operands are `True`

### Loops

#### `for`

- **Definition**: used for looping, generally when we know the number of times we want to loop with any type of sequence like a list or string.

#### `in`

- **Definition**: used to test if a sequence \(list, tuple, string, etc.\) contains a value. It returns `TRUE` if the value is present. Its secondary use is to traverse through a sequence in a `for` loop.

#### `while`

- **Definition**: used for looping. The statements inside this type of loop will continue to execute until the condition for the `while` loop evaluates to `FALSE` or a `break` statement is encountered.

#### `if`

- **Definition**: used for conditional branching or decision making.

#### `elif`

- **Definition**: short for "else if" used for conditional branching or decision making.

#### `else`

- **Definition**: used for conditional branching or decision making if the condition is false; the last resort.

#### `break`

- **Definition**: used to alter the loop's normal behavior; this will end the smallest loop it is in and control flows to the statement immediately below the loop.

#### `continue`

- **Definition**: used to alter the loop's normal behavior; causes to end the current iteration of the loop, but not the whole loop.

### User Defined Structures

#### `class`

- **Definition**: used to define a new user-defined class - which is a collection of related attributes and methods that try to represent a real world situation.

#### `def`

- **Definition**: used to define a new user-defined function.

#### `async`

- **Definition**: coroutine keywords that denote the beginning of an asynchronous function \(work in parallel\). Usually followed by `await` keyword.

#### `await`

- **Definition**: coroutine keywords that denote the beginning of a promise within an asynchronous function.

> **NOTE**: There can be as many `await` keywords within a function as needed.

### References

#### `del`

- **Definition**: used to delete the reference to an object.

#### `as`

- **Definition**: used to create an alias while importing a module, giving a different name to a module while importing it.

#### `is`

- **Definition**: used for testing object identity, by testing if the two variables refer to the same object. This will return `TRUE` if the objects are identical and `FALSE` if not.

#### `None`

- **Definition**: special constant in python that represents the absence of a value or null value.

> **NOTE**: It is an object with the datatype `NoneType`. There cannot be multiple `None` objects but can assign it to variables which would be equal to one another. `None` does NOT imply `False`, `0`, or empty list/string/dict.

### Exceptions

Exceptions are errors that suggest something went wrong while executing the program. Some examples of errors that one could encounter are `IOError`, `ValueError`, `ZeroDivisionError`, `ImportError`, `NameError`, `TypeError`. To catch exceptions, use `try...except`blocks.

#### `except`

- **Definition**: used with exceptions, where `try...except` blocks are used to catch exceptions if they fail the `try` set of instructions.

#### `try`

- **Definition**: used with exceptions, where `try...except` blocks are used to catch exceptions by trying out a set of instructions to see if an exception occur.

#### `raise`

- **Definition**: to raise an exception explicitly.

#### `finally`

- **Definition**: used with `try...except` statements to close up resources or file streams. This ensures that the block of code inside it gets executed even if there is an unhandled exception.

### Module Abstractions

#### `from`

- **Definition**: to import specific attributes or functions into the current namespace, use `from...import`.

#### `import`

- **Definition**: used to import modules into the current namespace.

### Variable Declarations

#### `global`

- **Definition**: used to declare that a variable inside the function is global \(outside the function\).

> **NOTE**: As a global variable, if we need to read the value of the variable we do not need to define it as global. If we need to modify the value of a global variable inside a function, then we must declare it with global, otherwise a local variable is created.

#### `lambda`

- **Definition**: used to create an inline, anonymous function \(function without a name\), without a `return` statement, consisting of an expression that is evaluated and returned.

#### `nonlocal`

- **Definition**: used to declare that a variable inside a nested function \(function inside a function\) is not local to it, meaning it lies in the outer inclosing function. \(similar to the `global` keyword\).

> **NOTE**: If you need to modify a non-local variable inside a nested function, then we must declare it with `nonlocal`. Otherwise a local variable with that name is created inside the nested function.

### Function Properties

#### `pass`

- **Definition**: null statement where nothing happens when executed, mainly used as a placeholder.

#### `return`

- **Definition**: used inside a function to exit and return a value.

> **NOTE**: If we do not return a value explicitly, `NONE` is returned automatically.

#### `with`

- **Definition**: statement used to wrap the execution of a block of code within methods defined by the context manager.

> **NOTE**: "Context Manager" is a class that implements `__enter__` and `__exit__` methods. Use of `with` statement ensures that the `__exit__` method is called at the end of the nested block. Tis concept is similar to the use of `try...finally` block.

#### `yield`

- **Definition**: used inside a function like a `return` statement, however it returns a generator.

> **NOTE**: A Generator is an iterator that generates one item at a time. A large list of value will take up a lot of memory. Generators are useful in this situation as it generates only one value at a time instead of storing all the values in memory.

### Debugging

#### `assert`

- **Definition**: used for debugging purposes by checking the internal state or if assumptions are true.

> **NOTE**: If the assert condition is true, nothing will happen. But if the condition is false, the error - `AssertionError` is raised.
