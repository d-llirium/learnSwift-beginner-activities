/*:
 ## Dictionaries
 
 ### Morse Code
 
 Exercise:
 
 Morse code, named after American artist Samuel Finley Breese Morse, is a method of telecommunication that visually encodes letters into unique combinations of dots . and dashes -:
 
 Here are a few rules to know when deciphering a Morse code message:

 Each character is separated by a single space.
 Each word is separated by three spaces.
 Capitalization does not matter.
 In this project, we are going to write a Swift program that uses dictionaries to encrypt and decrypt secret Morse code messages.
 
 */
import Foundation

var englishText = "THIS is a secret message"
print( "English Text: \(englishText)")
englishText = englishText.lowercased()

// Add your code below 🤫
var letterToMorse: [String: String] = [
    "a": ".-",
    "b": "-...",
    "c": "-.-.",
    "d": "-..",
    "e": ".",
    "f": "..-.",
    "g": "--.",
    "h": "....",
    "i": "..",
    "j": ".---",
    "k": "-.-",
    "l": ".-..",
    "m": "--",
    "n": "-.",
    "o": "---",
    "p": ".--.",
    "q": "--.-",
    "r": ".-.",
    "s": "...",
    "t": "-",
    "u": "..-",
    "v": "...-",
    "w": ".--",
    "x": "-..-",
    "y": "-.--",
    "z": "--..",
    ".": ".-.-.-",
    "?": "..--..",
    ",": "--..--",
    "!": "-.-.--"
  ]
print("letterToMorse: \n-------------\n\(letterToMorse)")
var morseText: String = ""

for element in englishText{
  if let morseChar = letterToMorse["\(element)"]{// if it is a letter on the msg
    morseText += "\(morseChar) " // add the code and a space for the next letter
  } else{// if it is a space on the message
    morseText += "   "// add three spaces
  }
}
print("morseText: \(morseText)")


var secretMessage = ".... --- .-- -.. -.--   .--. .- .-. - -. . .-. -.-.--"

var decodedMessage: String = ""

var morseCodeArray: [String] = []
var currMorse: String = ""
for char in secretMessage{
  if char != " "{
    currMorse.append(char)
  } else {
    switch currMorse {
    case "":// the first space between two Morse code letters
    currMorse += " "
    case " ": // space between two Morse code words
    morseCodeArray.append(" ")
    currMorse = ""
    default:// we’ve reached the end of a Morse code letter
    morseCodeArray.append(currMorse)
    currMorse = ""
    }
  }
}
  morseCodeArray.append(currMorse)// each Morse code letter contained as an individual element
  print("morseCodeArray: \(morseCodeArray)")

var morseToLetter: [String: String] = [:]
for (letter, morseChar) in letterToMorse {
  morseToLetter[morseChar] = letter
}
print("morseToLetter Alphabet: \n-------------\n\(morseToLetter)")

var counter = 0
for morseValue in morseCodeArray {
    if let letterChar = morseToLetter[morseValue] {
        if counter == 0 {
            decodedMessage += letterChar.uppercased() //  adds the translated letter to to our decodedMessage variable.
            counter += 1
        } else if letterChar == "."{
            decodedMessage += letterChar
            counter = 0
        } else {
            decodedMessage += letterChar
            counter += 1
        }
    } else {
        decodedMessage += " "
    }
}


print("decodedMessage: \( decodedMessage )")
/*:
 OUTPUT:
 
 English Text: THIS is a secret message
 letterToMorse:
 -------------
 ["g": "--.", ".": ".-.-.-", "v": "...-", "a": ".-", "e": ".", "d": "-..", "c": "-.-.", "o": "---", "u": "..-", "p": ".--.", "!": "-.-.--", "y": "-.--", "f": "..-.", "i": "..", "t": "-", "n": "-.", "k": "-.-", "x": "-..-", "r": ".-.", "m": "--", "z": "--..", "?": "..--..", "j": ".---", "l": ".-..", "b": "-...", "h": "....", "q": "--.-", "s": "...", ",": "--..--", "w": ".--"]
 morseText: - .... .. ...    .. ...    .-    ... . -.-. .-. . -    -- . ... ... .- --. .
 morseCodeArray: ["....", "---", ".--", "-..", "-.--", " ", ".--.", ".-", ".-.", "-", "-.", ".", ".-.", "-.-.--"]
 morseToLetter Alphabet:
 -------------
 ["---": "o", "....": "h", "-.-.": "c", "-.": "n", "-.-": "k", "--.-": "q", "-..": "d", ".": "e", "--": "m", "...": "s", "-..-": "x", ".-.": "r", "-.-.--": "!", ".--.": "p", ".-": "a", "..": "i", "-...": "b", ".--": "w", "...-": "v", "--.": "g", "-": "t", "..--..": "?", ".-.-.-": ".", "--..": "z", ".-..": "l", "-.--": "y", ".---": "j", "--..--": ",", "..-.": "f", "..-": "u"]
 decodedMessage: Howdy partner!

 */
//: [< Previous](@previous) | [Next: Functions](@next)


