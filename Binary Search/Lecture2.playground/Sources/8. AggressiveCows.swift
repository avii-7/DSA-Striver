//
//  8. AggressiveCows.swift
//  
//
//  Created by Arun on 31/03/25.
//

// LC: https://www.naukri.com/code360/problems/aggressive-cows_1082559

/*
 You are given the task of assigning stalls to 'k' cows such that the minimum distance between any two of them is the maximum possible.
 Take an example of [4, 2, 1, 3, 6] with cows (k) = 2

If we try to place cows at unsorted stall positions (according to the given array), it would look like this:

(OLD Way)
    stalls =>   4 | 2 | 1 | 3 | 6   -> Min
                C | C | X | X | X       2
                C | X | C | X | X       3
                C | X | X | C | X       1
                X | X | C | X | C       5
                ...and more placements are possible.

There can be `x` number of placements of `k` cows at different stall positions, which can result in `y` different minimum distances. The answer would be the **maximum** among those minimums. But we can't solve the problem effectively this way.

One important observation is that the minimum distance can be as small as 1 and as large as `max` — where:

    max = (maximum element of the array) - (minimum element of the array)

If we sort the array and check all possible minimum distances from 1 (since two cows cannot occupy the same stall) up to `max`, we can determine the **maximum possible minimum distance**.

Here, we are checking every possible minimum from the range 1...`max`. However, this range may include invalid values that aren't achievable as actual minimum distances.

Because the array is sorted, the number of positions we need to check is reduced. In the unsorted approach, multiple placements might yield the same minimum, and it becomes harder to find the actual maximum of those minimums. For example, if you place cows at positions 4 and 6, the distance is 2, but it may not satisfy the required conditions for placing all cows optimally.

In short, by sorting the array and checking for every possible minimum distance, we stop at the largest valid one.

Sorted stalls => 1 | 2 | 3 | 4 | 6   -> Min
                 C | C | X | X | X       1
                 C | X | C | X | X       2
                 C | X | X | C | X       3
                 C | X | X | X | C       5 (4 is also possible)
                 C | X | X | X | X       (6 is not possible, so we stop here)
*/

private func canWeMaintain(distance: Int, _ stalls: [Int], maxCows: Int) -> Bool {
    var cows = 1
    var startIndex = 0
    
    for i in 1...(stalls.count - 1) {
        if stalls[i] - stalls[startIndex] >= distance {
            cows += 1
            startIndex = i
            
            if cows >= maxCows {
                return true
            }
        }
    }
    
    return false
}

public func aggressiveCows(_ unsortedStalls: [Int], k: Int) -> Int {
    
    let stalls = unsortedStalls.sorted()
    let max = stalls.last! - stalls.first!
    
    for distance in 1...max {
        if canWeMaintain(distance: distance, stalls, maxCows: k) {
            continue
        }
        else {
            return distance - 1
        }
    }
    
    return max
}

public func aggressiveCows1(_ unsortedStalls: [Int], k: Int) -> Int {
    
    let stalls = unsortedStalls.sorted()
    let max = stalls.last! - stalls.first!
    
    var low = 1, high = max
    
    while low <= high {
        
        let mid = (low + high) / 2

        if canWeMaintain(distance: mid, stalls, maxCows: k) {
            low = mid + 1
        }
        else {
            high = mid - 1
        }
    }
    
    return high
}
