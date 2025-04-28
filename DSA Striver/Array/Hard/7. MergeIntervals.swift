//
//  7. MergeIntervals.swift
//  DSA Striver
//
//  Created by Arun on 28/04/25.
//

// https://leetcode.com/problems/merge-intervals/


// Time Complexity: O(nlogn) + O(n * n)
func mergeBrute(_ intervals: [[Int]]) -> [[Int]] {
    var i = 0
    
    let sortedIntervals = intervals.sorted {
        if $0[0] == $1[0] {
            return $0[1] < $1[1]
        }
        else {
            return $0[0] < $1[0]
        }
    }
    
    var arr = [[Int]]()
    
    while(i < sortedIntervals.count) {
        
        var tba = sortedIntervals[i]
        
        for j in i+1..<sortedIntervals.count {
            if tba[1] >= sortedIntervals[j][0] {
                if tba[1] <= sortedIntervals[j][1] {
                    tba[1] = sortedIntervals[j][1]
                }
                i += 1
            }
            else {
                break
            }
        }
        i += 1
        arr.append(tba)
    }
    
    return arr
}


//print(mergeBrute([[1,4],[2,3]]))
//print(mergeBrute([[1,3],[2,6],[8,10],[15,18]]))
//print(mergeBrute([[1,4],[4,5]]))
//print(mergeBrute([[1,4],[0,4]]))

// TC -> O(nlogn) + O(n)
// SC -> O(n)
public func mergeOptimal(_ unsortedIntervals: [[Int]]) -> [[Int]] {
    
    let intervals = unsortedIntervals.sorted {
        if $0[0] == $1[0] {
            return $0[1] < $1[1]
        }
        return $0[0] < $1[0]
    }
    
    var result = [intervals.first!]
    
    for i in 1...(intervals.count - 1) {
        
        let interval = intervals[i]
        // Intersect
        if result.last![1] >= interval[0] && result.last![1] <= interval[1] {
            result[result.count - 1][1] = interval[1]
        }
        // In-between
        else if result.last![0] <= interval[0] && result.last![1] >= interval[1] {
            // No need to do anything
        }
        else {
            result.append(interval)
        }
    }
    
    return result
}

//
//print(mergeOptimal([[1,4],[2,3]]))
//print(mergeOptimal([[1,3],[2,6],[8,10],[15,18]]))
//print(mergeOptimal([[1,4],[4,5]]))
//print(mergeOptimal([[1,4],[0,4]]))
