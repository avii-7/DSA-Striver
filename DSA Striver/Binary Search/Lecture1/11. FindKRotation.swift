//
//  11. FindKRotation.swift
//  DSA Striver
//
//  Created by Arun on 28/04/25.
//

import Foundation

// GFG: https://www.geeksforgeeks.org/problems/rotation4723/1
// Article: https://takeuforward.org/arrays/find-out-how-many-times-the-array-has-been-rotated/

// BFA
// TC -> O(n)
func findKRotation(_ arr: [Int]) -> Int {
    
    for i in 0...(arr.count - 2) {
        if arr[i] > arr[i + 1] {
            return i + 1
        }
    }
    
    return 0
}

// Optimal Solution
// TC -> O(logN)
func findKRotation2(_ arr: [Int]) -> Int {
    for i in 0...(arr.count - 2) {
        if arr[i] > arr[i + 1] {
            return i + 1
        }
    }
    
    return 0
}

//let testCases = [
//    [3, 4, 5, 1, 2], // 5
//    [4, 5, 6, 7, 0, 1, 2], // 7
//    [2, 4, 5, 6, 7, 0, 1], // 7
//    [6, 7, 0, 1, 2, 3, 5], // 7
//    
//    [5, 0, 1, 2, 3, 4], // 5
//    
//    [0, 1, 2, 3, 4, 5], // 5
//    [4, 5, 0, 1, 2, 3], // 5
//]
//for testCase in testCases {
//    print(testCase, findKRotation2(testCase), separator: " --> ")
//}
