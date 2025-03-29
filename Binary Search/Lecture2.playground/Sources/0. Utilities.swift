//
//  0. Utilities.swift
//  
//
//  Created by Arun on 25/03/25.
//

let separator = " ➡️ "

public func execute<T, R: Equatable>(inputs: [T], expectedOutputs: [R], for problem: (T) -> R) {
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
