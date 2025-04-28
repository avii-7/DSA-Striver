//
//  2. LowerBound.swift
//  DSA Striver
//
//  Created by Arun on 28/04/25.
//

// Problem: https://www.naukri.com/code360/problems/lower-bound_8165382
// Lower Bound: smallest Index but x <= arr[Idx]

// TC -> O(n)
func lowerBound(arr: [Int], n: Int, x: Int) -> Int {
    
    for i in arr.indices {
        if x <= arr[i] {
            return i
        }
    }
    
    return arr.count
}

// TC -> O(log(n))
func lowerBound(arr: [Int], k: Int) -> Int {
    
    var low = 0, high = arr.count - 1
    var ans = arr.count
    
    while(low <= high) {
        let mid = (low + high) / 2
        
        if k <= arr[mid] {
            high = mid - 1
            ans = mid
        }
        else {
            low = mid + 1
        }
    }
    
    return ans
}

//let arr = [1, 2, 8, 10, 11, 12, 19]
//let k = 12
//print(lowerBound(arr: arr, k: k))
