//
//  Utilities.swift
//  DSA Striver
//
//  Created by Arun on 28/04/25.
//

import Foundation

public func execute<T, R: Equatable>(inputs: [T], expectedOutputs: [R], for problem: (T) -> R) {
    let separator = " ➡️ "
    for i in inputs.indices {
        let output = problem(inputs[i])
        print(inputs[i], output, separator: separator, terminator: " .... ")
        print(output == expectedOutputs[i] ? "✅" : "❌ ...... Expected: \( expectedOutputs[i])")
    }
}


public func findMax(arr: [Int]) -> Int {
    
    var maxi = Int.min
    
    for ele in arr {
        if ele > maxi {
            maxi = ele
        }
    }
    
    return maxi
}

public func findSmallAndMax(arr: [Int]) -> (small: Int, max: Int) {
    
    var small = Int.max
    var maxi = Int.min

    for ele in arr {
        if ele > maxi {
            maxi = ele
        }
        
        if ele < small {
            small = ele
        }
    }
    
    return (small, maxi)
}

public func calculateSum(_ arr: [Int]) -> Int {
    arr.reduce(0, +)
}

public func findMinAndSum(arr: [Int]) -> (min: Int, sum: Int) {
    var sum = 0
    var min = Int.max
    
    for ele in arr {
        sum += ele
        
        if ele < min {
            min = ele
        }
    }
    
    return (min, sum)
}


public func findMaxAndSum(arr: [Int]) -> (min: Int, sum: Int) {
    var sum = 0
    var maxi = Int.min
    
    for ele in arr {
        sum += ele
        
        if ele > maxi {
            maxi = ele
        }
    }
    
    return (maxi, sum)
}
