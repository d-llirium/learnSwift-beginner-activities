/*:
 ## Conditionals
 
 ### Magic 8-Ball
 
 Exercise:
 
 create a program that can answer any “Yes” or “No” question with a different fortune each time
 */
import Foundation

var playerName = ""
var playerQuestion = "Eu amo a Patricia?"
var randomNumber = Int.random(in: 1...9)
//print(randomNumber)
var eightBall: String
switch randomNumber {
  case 1:
    eightBall = "Yes - definitely"
  case 2:
    eightBall = "It is decidedly so"
  case 3:
    eightBall = "Without a doubt"
  case 4:
    eightBall = "Reply hazy, try again"
  case 5:
    eightBall = "Ask again later"
  case 6:
    eightBall = "Better not tell you now"
  case 7:
    eightBall = "My sources say no"
  case 8:
    eightBall = "Outlook not so good"
  case 9:
    eightBall = "Very doubtful"
  default:
    eightBall = "Error"
}
playerName == "" ? print(playerQuestion) : print("\(playerName) asks \(playerQuestion)")

print("Magic 8 Ball's answer: \(eightBall)")
/*:
 OUTPUT:
 
 Eu amo a Patricia?
 Magic 8 Ball's answer: Reply hazy, try again

 */
//: [< Previous](@previous) | [Next: Arrays and Loops](@next)
 
