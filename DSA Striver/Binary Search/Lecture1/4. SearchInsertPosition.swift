//
//  4. SearchInsertPosition.swift
//  DSA Striver
//
//  Created by Arun on 28/04/25.
//

import Foundation

// return the index if the target is found. If not, return the index where it would be if it were inserted in order.

// TC -> O(n)
func searchInsertBrute(_ nums: [Int], _ target: Int) -> Int {
    
    for i in nums.indices {
        if target <= nums[i] {
            return i
        }
    }
    
    return nums.count
}

// TC -> O(logN)
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var low = 0, high = nums.count - 1
    
    var ans = nums.count
    
    while (low <= high) {
        
        let mid = (low + high) / 2
        
        if nums[mid] == target {
            return mid
        }
        else if target < nums[mid] {
            high = mid - 1
            ans = mid
        }
        else {
            low = mid + 1
        }
    }
    
    return ans
}

//let nums = [1,3,5,6], target = 5
//print(searchInsert(nums, 5))
