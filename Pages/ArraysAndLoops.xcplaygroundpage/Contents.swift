/*:
 ## Arrays And Loops
 
 ### Caesar's Cipher
 
 Exercise:
 
 The Caesar’s Cipher is one of the simplest and most widely known encryption techniques. It is named after Julius Caesar because it was used by the Roman Empire to encode military secrets.

 To use the cipher, draw the alphabet in a circle.
 
 //: ![Caesar Cipher](CaesarCipher-full-diagram.svg)
 
 Take every letter of your message and shift it three places to the right. For example:
 //: ![Caesar Cipher Key](CaesarCipher-key.svg)

 The letter a becomes d.
 The letter b becomes e.
 The letter c becomes f.
 The word hello becomes khoor.
 
 Write a CaesarCipher.swift program that encrypts a message by shifting each letter three places to the right.

 */
import Foundation

let alphabet: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
var secretMessage = "CoDecademy"
secretMessage = secretMessage.lowercased()
var message = Array(secretMessage)
print(secretMessage)
print(message)
for i in 0 ..< message.count {
  for j in 0 ..< alphabet.count {
    if message[i] == alphabet[j] {
      message[i] = alphabet[(j+3) % 26]
      break
    }
  }
}
print(message)
let encrypted = String(message)
print(encrypted)
/*:
 OUTPUT:
 codecademy
 ["c", "o", "d", "e", "c", "a", "d", "e", "m", "y"]
 ["f", "r", "g", "h", "f", "d", "g", "h", "p", "b"]
 frghfdghpb

 */
//: [< Previous](@previous) | [Next: Dictionaries](@next)
 
