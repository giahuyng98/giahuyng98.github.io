---
title: SOLID
date: "2020-07-27T00:00:00.000Z"
description: "SOLID"
---

# Class design principles

|Alias| Name                            | Definition                                   |
|:---:|---------------------------------|----------------------------------------------|
|SRP  | Single Responsibility Principle | A class should have one, and only one, reason to change.|
|OCP  | The Open Closed Principle       | Able to extend a classes behavior, without modifying it.|
|LSP  | The Liskov Substitution Principle| Derived classes must be substituable for their base classes.|
|ISP  | The Interface Segregation Principle| Make fine grained interfaces that are client specific.|
|DIP  | The Dependency Inversion Principle| Depend on abstractions, not on conretions.|

## Single Responsibility Principle
- **A class should have only one reason to change**
- Why: If a class has more than one responsibility, then there will be more than one reason for it to change. the responsibilities become coupled, changes to one responsibility may *impair* or *inhibit* the class'ability to meet the others. Leads to fragile designs that break in unexpected ways when changed.

``` java
// Violate SRP
// Print format may be change
// Average score may change

class Student {
    private String name;
    private float mathScore;
    private float physicScore;
    private float chemistryScore;

    public float calculateAvgScore() {
        return (mathScore + physicScore + chemistryScore) / 3.0;
    }

    public void print() {
        System.out.println("Student: " + name + ", "
                         + "Average score: " + calculateAvgScore());
    }
}
```

- SRP is one of the simplest of the principles, and one of the hardest to get right.

## The Open Closed Principle
- **Software entities (classes, modules, functions, etc.) should be open for extension, but closed for modification.**
- It says that you should design modules that *never change*. When requirements change, you extend the bahavior of such modules by add new code, not by changing old code that already works.
  1. `Open for extension`: Behavior of the module can be extended. We can make module behave in new different ways as the requirements change, or to meet the needs of new applications.
  2. `Closed for modification`: Source code of such a module is inviolate. No one is allowed to make source code changes to it

``` java
class Shape {
    // some attributes
}
class Rectangle extends Shape {
    // location
    private float width;
    private float height;
}
class Circle extends Shape {
    // location
    private float radius;
}
class Drawer {
    public static void draw(List<Shape> shapes) {
        for(Shape shape : shapes) {
            if (shape instanceof Rectangle) {
                // draw rectangle
            } else if (shape instanceof Circle) {
                // draw circle
            }
        }
    }
}
```

- The code above does not conform to the OCP principle, has to modify `draw()` function if new kinds of shapes added, switch may repeated over and over again in various funcions... Adding a new shape means hunting for every place that such switch statements exist, and adding the new shape to each.
 
 ``` java
 abstract class Shape {
     public abstract void draw();
 }

 class Rectangle extends Shape {
     public void draw() {
         //implement
     };
 }

 class Circle extends Shape {
     public void draw() {
         //implement
     };
 }
class Drawer {
    public static void draw(List<Shape> shapes) {
        for(Shape shape : shapes) {
            shape.draw();
        }
    }
}
 ```

- If we want to add new kind of shape, all we need to do is add a new dirvative of the Shape class and implement all its functions, e.g `draw()`
- 

# Packages design principles

# References
- [ArticleS.UncleBob.PrinciplesOfOod](http://www.butunclebob.com/ArticleS.UncleBob.PrinciplesOfOod)
