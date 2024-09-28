//: [Previous](@previous)
// 28/09/24

import Foundation

// 229. Majority Element II
// https://leetcode.com/problems/majority-element-ii/description/

// BFA

// TC -> O(n * n)
// If you calculate, then you will see result array will always hold atmost 2 elements,
// then `result.contains(nums[i])` won't contribute much in TC (as for every element we are doing
// linear search in array having size of 2)
// so our effective TC will be O(n * n)

// As maximum size of result can be 2 elements.
// We can say that SC will O(1)

func majorityElement(_ nums: [Int]) -> [Int] {
    var result = [Int]()
    
    var requiredFreq = nums.count / 3
    for i in nums.indices where result.contains(nums[i]) == false {
        var freq = 0
        for j in i..<nums.count {
            if nums[i] == nums[j] {
                freq += 1
                if freq > requiredFreq {
                    result.append(nums[i])
                    break
                }
            }
        }
    }
    
    return result
}

print(majorityElement([1,2]))
