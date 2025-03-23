//
//  3. KokoEatingBananas.swift
//  
//
//  Created by Arun on 22/03/25.
//


// LC: -> https://leetcode.com/problems/koko-eating-bananas/description/
// Article: -> https://takeuforward.org/binary-search/koko-eating-bananas/

import Foundation

func findMax(arr: [Int]) -> Int {
    
    var maxi = Int.min
    
    for ele in arr {
        if ele > maxi {
            maxi = ele
        }
    }
    
    return maxi
}

func calculateHours(_ arr: [Int], _ speed: Int) -> Int {
    
    var tempHour = 0
    
    for ele in arr {
        tempHour += Int(ceil(Double(ele) / Double(speed)))
    }
    
    return tempHour
}

// TC -> O(n  + max(arr) * n)
// TC on the basis of finding the max + (traversing the array upto max * calculatingHours)
public func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
    
    let max = findMax(arr: piles)
    
    // Number of hours will reduce as we go from 1 to max
    for i in 1...max {
        
        let hours = calculateHours(piles, i)

        if hours <= h {
            return i
        }
    }
    
    return -1
}

// TC -> O(n + log(max(arr)) * n)
public func minEatingSpeed2(_ piles: [Int], _ h: Int) -> Int {
    
    let max = findMax(arr: piles)
    
    var low = 1, high = max
    
    while low <= high {
        let mid = (low + high) / 2
        let midHours = calculateHours(piles, mid)
        
        if midHours <= h {
            high = mid - 1
        }
        else {
            low = mid + 1
        }
    }
    
    return low
}
