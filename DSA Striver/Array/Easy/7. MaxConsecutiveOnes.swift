//
//  7. MaxConsecutiveOnes.swift
//  
//
//  Created by Arun on 25/03/25.
//

// TC -> O(n)
public func findMaxConsecutiveOnes(arr: [Int]) -> Int {
    
    var maxCount = 0
    var count = 0
    
    for ele in arr {
        if ele == 1 {
            count += 1
        }
        else {
            maxCount = max(maxCount, count)
            count = 0
        }
    }
    
    maxCount = max(maxCount, count)
    
    return maxCount
}
