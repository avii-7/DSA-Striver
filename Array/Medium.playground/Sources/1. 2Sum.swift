//
//  1. 2Sum.swift
//  
//
//  Created by Arun on 27/03/25.
//

// BFA

// TC -> O(n * n)

public func twoSumBrute(_ nums: [Int], _ target: Int) -> [Int] {
    
    for i in nums.indices {
        for j in i+1..<nums.count {
            if nums[i] + nums[j] == target {
                return [i, j]
            }
        }
    }
    
    return []
}

//print(twoSumBrute([2, 7, 11, 15], 9))


// TC -> O(n)
// SC -> O(n)

public func twoSumBest(_ nums: [Int], _ target: Int) -> [Int] {
    
    var dict = Dictionary<Int, Int>()
    
    for i in nums.indices {
        if let value = dict[target - nums[i]] {
            return [i, value]
        }
        else {
            dict[nums[i]] = i
        }
    }
    
    return []
}

//print(twoSumBest([2, 7, 11, 15], 9))
