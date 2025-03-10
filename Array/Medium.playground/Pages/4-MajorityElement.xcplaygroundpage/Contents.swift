//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

// Optimal Solution
// TC -> O(n)
func majorityElement( arr: [Int]) -> Int {
    var count = 1
    var result = arr[0]
    
    for i in 1..<arr.count {
        if count == 0 {
            result = arr[i]
            count += 1
        }
        else if arr[i] == result {
            count += 1
        }
        else {
            count -= 1
        }
    }
    
    return result
}
