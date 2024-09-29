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
    
    let requiredFreq = nums.count / 3
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


// MARK: - Best Approach

// TC -> O(2n)
// SC -> O(n)

func majorityElement2(_ nums: [Int]) -> [Int] {
    
    var dict = Dictionary<Int, Int>()
    
    for ele in nums {
        
        if let value = dict[ele] {
            dict[ele] = value + 1
        }
        else {
            dict[ele] = 1
        }
    }
    
    let requiredFreq = nums.count / 3
    
    var result = Array<Int>()
    result.reserveCapacity(2)
    
    for (key, value) in dict {
        if value > requiredFreq {
            result.append(key)
        }
    }
    
    return result
}

print(majorityElement2([1,2]))


// MARK: - Optimal Approach

// TC -> O(n) + O(n)
// SC -> O(1)

func majorityElement_OA(_ nums: [Int]) -> [Int] {
    
    var count1 = 0, count2 = 0
    var ele1 = Int.min, ele2 = Int.min
    
    for num in nums {
        
        if ele1 == num {
            count1 += 1
        }
        else if ele2 == num {
            count2 += 1
        }
        else if count1 == 0 {
            count1 = 1
            ele1 = num
        }
        else if count2 == 0 {
            count2 = 1
            ele2 = num
        }
        else {
            count1 -= 1
            count2 -= 1
        }
    }

    var freq1 = 0
    var freq2 = 0
    
    for num in nums {
        if num == ele1 {
            freq1 += 1
        }
        else if num == ele2 {
            freq2 += 1
        }
    }
    
    var result = [Int]()
    let reqFreq = nums.count / 3

    if freq1 > reqFreq {
        result.append(ele1)
    }
    
    if freq2 > reqFreq {
        result.append(ele2)
    }
    
    return result
}

print(majorityElement_OA([3, 2, 3]))
