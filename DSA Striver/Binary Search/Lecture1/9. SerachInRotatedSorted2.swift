//
//  9. SerachInRotatedSorted2.swift
//  DSA Striver
//
//  Created by Arun on 28/04/25.
//

import Foundation

// Article: https://takeuforward.org/arrays/search-element-in-rotated-sorted-array-ii/
// LC: https://leetcode.com/problems/search-in-rotated-sorted-array-ii/

// BFA
// TC -> O(logN + log(n/2))
func checkIfSorted(_ nums: [Int], start: Int, end: Int) -> Bool {
    
    if nums[start] > nums[end] {
        return false
    }

    var start = start, end = end
    
    while start < end {
        if nums[start] > nums[start + 1] {
            return false
        }
        start += 1
    }
    return true
}

func search(_ arr: [Int], _ target: Int) -> Bool {
    var low = 0, high = arr.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        
        if arr[mid] == target {
            return true
        }
        // Check is left part sorted or not ?
        else if checkIfSorted(arr, start: low, end: mid) {
            
            if arr[low] <= target && target < arr[mid] {
                high = mid - 1
            }
            else {
                low = mid + 1
            }
        }
        else { // right part is sorted or not
            
            if arr[mid] < target && target <= arr[high] {
                low = mid + 1
            }
            else {
                high = mid - 1
            }
        }
    }
    
    return false
}


// _________________________________________________________________________________

// Optimal Approach
// case: - [1, 0, 1, 1, 1]
// Observation: arr[low] == arr[mid] == arr[high]

// TC -> Average Case -> O(logN)


// TC -> WorstCase -> O(n/2)
// Explanation: Suppose you have array like this: [1, 1, 1, 1, 0, 1, 1, 1, 1, 1]
// In that case you keep on shrinking from left and right and end up iterating nearly half of the array and then apply BS on rest of elemenets.

func search2(_ arr: [Int], _ target: Int) -> Bool {
    var low = 0, high = arr.count - 1
    
    while low <= high {
        let mid = (low + high) / 2
        
        if arr[mid] == target {
            return true
        }
        else if arr[low] == arr[mid] && arr[mid] == arr[high] {
            low = low + 1
            high = high - 1
            continue
        }
        // Check is left part sorted or not ?
        else if arr[low] <= arr[mid] {
            
            if arr[low] <= target && target < arr[mid] {
                high = mid - 1
            }
            else {
                low = mid + 1
            }
        }
        else { // right part is sorted or not
            
            if arr[mid] < target && target <= arr[high] {
                low = mid + 1
            }
            else {
                high = mid - 1
            }
        }
    }
    
    return false
}

//let nums = [4, 5, 6, 7, 0, 1, 2]
//let target = 0

//let nums = [2,5,6,0,0,1,2]
//let target = 3

//let nums = [5,1,3]
//let target = 3
//
//print(search(nums, target))
