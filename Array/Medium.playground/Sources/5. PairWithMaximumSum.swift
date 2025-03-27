//
//  5. PairWithMaximumSum.swift
//  
//
//  Created by Arun on 27/03/25.
//


// https://www.geeksforgeeks.org/problems/max-sum-in-sub-arrays0824/0

// BFA
// TC -> O(n * n)
func pairWithMaxSum(_ arr: [Int]) -> Int {
    var maxi = Int.min
    
    for i in arr.indices {
        var small = arr[i]
        var ss = Int.max
        
        for j in (i + 1)..<arr.count {
            if arr[j] < small {
                ss = small
                small = arr[j]
            }
            else if arr[j] < ss {
                ss = arr[j]
            }
            
            let sum = small + ss
            if sum > maxi {
                maxi = sum
            }
        }
    }
    
    return maxi
}

// Observation:
// Smallest and second smallest numbers are two numbers, if you carefully observe numbers whose sum is larger than others will be adjacent.

// Optimal
// TC -> O(n)
func pairWithMaxSum2(_ arr: [Int]) -> Int {
    var maxi = Int.min
    
    var sum = arr[0]
    
    for i in 1..<arr.count {
        sum += arr[i]
        
        if sum > maxi {
            maxi = sum
        }
        
        sum = arr[i]
    }
    
    return maxi
}
