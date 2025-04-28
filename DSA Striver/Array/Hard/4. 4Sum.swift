//
//  4. 4Sum.swift
//  DSA Striver
//
//  Created by Arun on 28/04/25.
//

import Foundation

// BFA

// TC-> O(n * n * n * n)
// SC-> O(m) + O(m), where m is number of quadruplets.

func fourSumBrute(_ nums: [Int], _ target: Int) -> [[Int]] {
    
    var result = Set<[Int]>()
    
    for i in nums.indices {
        for j in i+1..<nums.count {
            for k in j+1..<nums.count {
                for l in k+1..<nums.count {
                    if nums[i] + nums[j] + nums[k] + nums[l] == target {
                        let sortedQuadruplets = [nums[i], nums[j], nums[k], nums[l]].sorted()
                        result.insert(sortedQuadruplets)
                    }
                }
            }
        }
    }
    
    return Array(result)
}

//print(fourSumBrute([1,0,-1,0,-2,2], 0))
//print(fourSumBrute([2, 2, 2, 2, 2], 8))


// BA
// TC -> O(n*n*n)
// SC -> O(n) + O(m) * 2

func fourSumBest(_ nums: [Int], _ target: Int) -> [[Int]] {
    var result = Set<[Int]>()
    
    var set = Set<Int>()
    
    for i in nums.indices {
        for j in i+1..<nums.count {
            set.removeAll()
            for k in j+1..<nums.count {
                let value = target - nums[i] - nums[j] - nums[k]
                if set.contains(value) {
                    let sortedQuadruplets = [nums[i], nums[j], nums[k], value].sorted()
                    result.insert(sortedQuadruplets)
                }
                else {
                    set.insert(nums[k])
                }
            }
        }
    }
    
    return Array(result)
}

// Optimal
// TC -> O(nlogn) + O(n * n * n)
// SC -> O(m)

func fourSumOptimal(_ nums: [Int], _ target: Int) -> [[Int]] {
    
    let sortedNums = nums.sorted()
    var result = [[Int]]()
    
    for i in sortedNums.indices {
        
        if i > 0 && sortedNums[i] == sortedNums[i - 1] {
            continue
        }
        
        for j in i+1..<sortedNums.count {
            
            if j > i + 1 && sortedNums[j] == sortedNums[j - 1] {
                continue
            }
            
            var k = j + 1
            var l = sortedNums.count - 1
            
            while (k < l) {
                let sum = sortedNums[i] + sortedNums[j] + sortedNums[k] + sortedNums[l]
                
                if sum == target {
                    result.append([sortedNums[i], sortedNums[j], sortedNums[k], sortedNums[l]])
                    k += 1
                    l -= 1
                    
                    while (k < l && sortedNums[k] == sortedNums[k - 1]) { k += 1 }
                    while (k < l && sortedNums[l] == sortedNums[l + 1]) { l -= 1 }
                }
                else if sum < target {
                    k += 1
                }
                else {
                    l -= 1
                }
            }
        }
    }
    
    return result
}

//print(fourSumOptimal([1, 0, -1, 0, -2, 2], 0))
//print(fourSumBest([2, 2, 2, 2, 2], 8))
//print(fourSumOptimal([-2, -1, -1, 1, 1, 2, 2], 0))
