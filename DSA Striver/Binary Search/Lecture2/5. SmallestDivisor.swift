//
//  5. SmallestDivisor.swift
//  
//
//  Created by Arun on 28/03/25.
//

// LC: https://leetcode.com/problems/find-the-smallest-divisor-given-a-threshold/
import Foundation

private func getDivisonSum(for divisor: Int, _ arr: [Int]) -> Int {
    var sum = 0.0
    
    for ele in arr {
        sum += ceil(Double(ele) / Double(divisor))
    }
    
    return Int(sum)
}

// TC -> O(n) + O(max * n)
public func smallestDivisor(_ nums: [Int], _ threshold: Int) -> Int {
    let max = findMax(arr: nums)
    
    for i in 1...max {
        let sum = getDivisonSum(for: i, nums)
        
        if sum <= threshold {
            return i
        }
    }
    
    return -1
}

// TC -> O(n) + O(logMax) * O(n)
public func smallestDivisor2(_ nums: [Int], _ threshold: Int) -> Int {
    let max = findMax(arr: nums)
    
    var low = 1, high = max
    
    while low <= high {
        
        let mid = ( low + high ) / 2
        let sum = getDivisonSum(for: mid, nums)
        
        if sum <= threshold {
            high = mid - 1
        }
        else {
            low = mid + 1
        }
    }
    
    return low
}
