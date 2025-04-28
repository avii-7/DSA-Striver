//
//  7. NumberOfOccurences.swift
//  DSA Striver
//
//  Created by Arun on 28/04/25.
//

import Foundation


// TC -> O(N)
func countFreqBrute(arr: [Int], target: Int) -> Int {
    var count = 0
    for ele in arr {
        
        if ele == target {
            count += 1
        }
        else if count != 0 {
            break
        }
    }
    
    return count
}

// TC -> O(2LogN)
func countFreqOptimal(arr: [Int], target: Int) -> Int {
    
    // smallest index which is equal to the target
    var lowestIndex = -1
    var low = 0, high = arr.count - 1
    
    while (low <= high) {
        let mid = (low + high) / 2
        
        if target == arr[mid] {
            lowestIndex = mid
            high = mid - 1
        }
        else if target < arr[mid] {
            high = mid - 1
        }
        else {
            low = mid + 1
        }
    }
    
    if lowestIndex == -1 {
        return 0
    }
    
    var highestIndex = -1
    low = 0
    high = arr.count - 1
    
    while (low <= high) {
        
        let mid = (low + high) / 2
        
        if target == arr[mid] {
            highestIndex = mid
            low = mid + 1
        }
        else if target > arr[mid] {
            low = mid + 1
        }
        else {
            high = mid - 1
        }
    }
    
    return highestIndex - lowestIndex + 1
}

//let arr = [1, 1, 2, 2, 2, 2, 3]
//let target = 2
//
//print(countFreqOptimal(arr: arr, target: target))
