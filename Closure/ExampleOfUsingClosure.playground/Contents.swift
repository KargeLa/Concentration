import UIKit

//#1
let primes = [2.0, 5.0, 7.0, 9.0, 11.0]
let nagativePrimes = primes.map({-$0})
print(nagativePrimes)

//#2
let invertedPrimes = primes.map() { 1.0 / $0 }
print(invertedPrimes)

//#3
let primeStrings = primes.map { String($0) }
print(primeStrings)

//#4 Инициализация свойства
var someProperty: Type = {
    //конструируем значение для someProperty
    return <сконструированное значение>
}()

//#5 Замыкания захватывают окружающие их переменные
let ltuae = 42
operation = { ltuae * $0 }
arrayOfOperations.append(operation)
