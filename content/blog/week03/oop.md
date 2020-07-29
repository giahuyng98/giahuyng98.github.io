---
title: OOP
date: "2020-07-29T00:00:00.000Z"
description: "OOP"
---

# OOP basic
- Object-oriented programming (OOP): programming paradigm base on the concept of **object** contain: attributes and methods

- Classes: Definitions for the data format and vailable procedures.
- Objects: Instances of classes
- Dynamic dispatch: select the procedural code to execute when call method (message passing), (by lookup method at run time in object table)

- OOP Concepts/Features
  - Encapsulation: Binds together the data and functions, keep both safe from outsite => data hiding

  ``` java
  class Square {
    private float size; // data-hiding

    // ...getter/setter

    public float area() {
        return size * size;
    }

    // `pack` information about a square to a class...
  }
  ```

  - Abstraction: object should *only* expose a high-level mechanism for using it, hide implementation details.

  - Composition: Object can contain other objects in their instance variables. Represent **has-a** relationships.

  - Inheritance: **is-a-type-of** relationships, reuse the same procedures and data definitions, subclass can override the methods defined by supperclasses,
    - Multiple inheritance: inheritance from more 2 or more class
    - Abstract classes: Can't be instantiated
    - Composition over inheritance: Golang
  - Polymorphism: run which code? the parent class or one of its descendants

    ``` java
    class Person {
        private String name;
        private int age;

        public String toString() {
            return "Person {" +
                   "Name: " + name + ", " + 
                   "Age: " + age + "}";
        }
    }

    class EmployeeCard {
        private String cardNumber;
    }

    class Employee extends Person { // inheritance
        private EmployeeCard card; // compositions
    }

    class Coder extends Employee {
        public String toString() {
            return "Coder {" +
                   "Name: " + name + ", " + 
                   "Age: " + age + "}";
        }
    }

    class ITHelper extends Employee {
        public String toString() {
            return "ITHelper {" +
                   "Name: " + name + ", " + 
                   "Age: " + age + "}";
        }
    }

    class Printer {
        public void print(Person person) {
            // polymorphism
            System.out.println(person.toString());
        }
    }

    ```
# Purely OOP
- 7 qualities:
  1. Encapsulation/Data Hiding
  2. Inheritance
  3. Polymorphism
  4. Abstraction
  5. All predefined types are objects
  6. All user defined types are objects
  7. All operations performed on objects must be only through methods exposed at the objects

# Design patterns
- Gang of Four
  1. Cretional patterns (5):
    - Factory method
    - Abstract factory
    - Singleton
    - Builder
    - Prototype
  2. Structural patterns (7):
    - Adapter
    - Bridge
    - Composite
    - Decorator
    - Facade
    - Flyweight
    - Proxy
  3. Behavioral (11)
    - Chain-of-responsibility
    - Command
    - Interpreter
    - Iterator
    - Mediator
    - Memento
    - Observer
    - State
    - Strategy
    - Template method
    - Visitor
