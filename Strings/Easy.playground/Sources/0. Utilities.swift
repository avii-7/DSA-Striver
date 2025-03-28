//
//  0. Utilities.swift
//  
//
//  Created by Arun on 28/03/25.
//

let separator = " ➡️ "

public func execute<T, R: Equatable>(inputs: [T], expectedOutputs: [R], for problem: (T) -> R) {
    for i in inputs.indices {
        let output = problem(inputs[i])
        print(inputs[i], output, separator: separator, terminator: " .... ")
        print(output == expectedOutputs[i] ? "✅" : "❌ .... Expected: \(expectedOutputs[i])")
    }
}
