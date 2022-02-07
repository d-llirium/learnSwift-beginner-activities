/*:
 ## Classes
 
 ### Build a Pokédex
 
 Exercise:
 
 Pokémon is an international phenomenon that has taken the world by storm. Somewhere in a remote village called Pallet Town, there is a Pokémon Professor who is quietly studying these creatures.

 We will let him introduce himself:

 Hello, there! Welcome to the world of Pokémon. My name is Oak. People call me the Pokémon Professor.

 This world is inhabited by creatures called Pokémon. For some people, Pokémon are pets. Others use them to fight. As for myself… I study pokémon as a profession.
 There are over 896 Pokémons now in the wild, each with different characteristics such as name, types, weaknesses, and more. Help Professor Oak study them by categorizing them each into an electronic device — a Pokédex!

 Write a Pokedex.swift program that stores different Pokémon using classes and inheritance.
 
 */
import Foundation

// Write your code below 🤾‍♂️
class Pokemon{
  var num = 0
  var name = ""
  var type = [""]
  var ability = [""]
  init(num: Int, name: String, type: [String], ability: [String]){
    self.num = num
    self.name = name
    self.type = type
    self.ability = ability
  }
  func displayInfo(){
    var types = ""
    var abilities = ""
    for t in self.type{
      types += "\(t) | "
    }
    for a in self.ability{
      abilities += "\(a) | "
    }
      print("""
    ===================
    number \(self.num)
    name: \(self.name)
    type: \(types)
    ability: \(abilities)
    """)
  }
}
class GigantamaxPokemon: Pokemon{
  var location = ""
  init(num: Int, name: String, type: [String], ability: [String], location: String){
    self.location = location
    super.init(num: num, name: name, type: type, ability: ability)
  }
  override func displayInfo(){
    super.displayInfo()
    print("location: \(self.location)")
  }
}

var bulbasaur = Pokemon(num: 1, name: "Bulbasaur", type: ["Grass 🌱", "Poison 💀"], ability: ["Overgrow"])
var charmander = Pokemon(num: 4, name: "Charmander", type: ["Fire 🔥"], ability: ["Blaze"])
var squirtle = Pokemon(num: 7, name: "Squirtle", type: ["Water 💧"], ability: ["Torrent"])

bulbasaur.displayInfo()
charmander.displayInfo()
squirtle.displayInfo()

var pikachu = GigantamaxPokemon(num: 25, name: "Pikachu", type: ["Electr ⚡"], ability: ["Static", "Lightning Rod"], location: "Meetup Spot")

pikachu.displayInfo()

/*:
 OUTPUT:
 
 ===================
 
 number 1
 
 name: Bulbasaur
 
 type: Grass 🌱 |
 
 Poison 💀 |
 
 
 ability: Overgrow |
 
 ===================
 
 number 4
 
 name: Charmander
 
 type: Fire 🔥 |
 
 ability: Blaze |
 
 ===================
 
 number 7
 
 name: Squirtle
 
 type: Water 💧 |
 
 ability: Torrent |
 
 
 ===================
 
 number 25
 
 name: Pikachu
 
 type: Electr ⚡ |
 
 ability: Static |
 
 Lightning Rod |
 
 location: Meetup Spot
  

 14/14 Complete
 Back

 */
//: [< Previous](@previous)


