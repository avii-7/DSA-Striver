//
//  10. SplitArrayLargestSum.swift
//  
//
//  Created by Arun on 09/04/25.
//

// https://leetcode.com/problems/split-array-largest-sum
// https://www.naukri.com/code360/problems/painter-s-partition-problem_1089557

/*
 This question is similar to allocate books and Painter Partition
 */
private func getPossibleSplits(with target: Int, _ arr: [Int]) -> Int {
    
    var splits = 1, sum = 0
    
    for ele in arr {
        if sum + ele <= target {
            sum += ele
        }
        else {
            sum = ele
            splits += 1
        }
    }
    
    return splits
}

// TC -> O(n) +  O((max-sum) * n)
public func splitArray(_ arr: [Int], _ k: Int) -> Int {
    if arr.count == 1 {
        return arr[0]
    }
    
    let (max, sum) = findMaxAndSum(arr: arr)
    
    for target in max...sum {
        let possibleSplit = getPossibleSplits(with: target, arr)
        if possibleSplit <= k {
            return target
        }
    }
    
    return -1
}

// TC -> O(n) + O(log(max-sum) * n)
public func splitArray1(_ arr: [Int], _ k: Int) -> Int {
    if arr.count == 1 {
        return arr[0]
    }
    
    let (max, sum) = findMaxAndSum(arr: arr)
    
    var low = max, high = sum
    
    while low <= high {
        
        let mid = (low + high) / 2
        let possibleSplits = getPossibleSplits(with: mid, arr)
        
        if possibleSplits <= k {
            high = mid - 1
        }
        else {
            low = mid + 1
        }
    }
    
    return low
}
