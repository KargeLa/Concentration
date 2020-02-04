import UIKit

var str = "Hello, playground"

let pizzaJoint = "caf​é​ pesto"
let firstCharacterIndex = pizzaJoint.startIndex
let fourthCharacterIndex = pizzaJoint.index(firstCharacterIndex, offsetBy: 3)
let fourthCharacter = pizzaJoint[fourthCharacterIndex]

if let firstSpace = pizzaJoint.index(of: " ") {
    let secondWordIndex = pizzaJoint.index(firstSpace, offsetBy: 1)
    let secondWord = pizzaJoint[secondWordIndex..<pizzaJoint.endIndex]
}

let secondWord = pizzaJoint.components(separatedBy: " ")[1]

let characterArray = Array(pizzaJoint)

var s = pizzaJoint
s.insert(contentsOf:" foo",at: s.index(of: " ")!)

