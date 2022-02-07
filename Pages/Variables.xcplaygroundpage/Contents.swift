/*:
 ## Variables
 
 ### Quadratic Formula
 
 Exercise:
 
 Write a Swift program in Quadratic.swift that solves the quadratic equation for the x‘s
 */
import Foundation

var a: Double
var b: Double
var c: Double
a = 3.0
b = -11.0
c = -4.0
var root1: Double
root1 = (-b + (b*b - 4*a*c).squareRoot()) / (2*a)
print("Root 1 is \(root1)")

var root2: Double
root2 = (-b - (b*b - 4*a*c).squareRoot()) / (2*a)
print("Root 2 is \(root2)")

/*:
 OUTPUT:
 
 Root 1 is 4.0
 Root 2 is -0.3333333333333333
 */
/*:
 [< Previous](@previous) | [Next: Conditionals](@next)
 */
