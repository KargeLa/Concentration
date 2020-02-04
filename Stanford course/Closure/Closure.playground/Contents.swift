import UIKit

var str = "Hello, playground"
//var operation : (Double) -> Double
//operation = sqrt
//let result = operation(4.0)

//func changeSing (operand: Double) -> Double { return -operand}
//operation = changeSing
//let result2 = operation(4.0)

//#1
//var operation: (Double) -> Double
//operation = { (operand: Double) -> Double in return -operand}
//let result = operation(4.0)

//#2
//var operation: (Double) -> Double
//operation = { (operand) -> Double in return -operand}
//let result = operation(4.0)

//#3
//var operation: (Double) -> Double
//operation = { (operand) in return -operand}
//let result = operation(4.0)

////#4
//var operation: (Double) -> Double
//operation = { (operand) in -operand}
//let result = operation(4.0)

//#5
var operation: (Double) -> Double
operation = { -$0 }
let result = operation(4.0)
