import UIKit
import Foundation

var str = "Hello, playground"

func save() throws
do {
    try context.save()
} catch let error {
    throw error
}

try! context.save()
let x = try? errorProneFunctionThatReturnsAnInt()
