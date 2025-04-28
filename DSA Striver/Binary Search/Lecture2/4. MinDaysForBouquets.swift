//
//  4. MinDaysForBouquets.swift
//  
//
//  Created by Arun on 25/03/25.
//

// Article: https://takeuforward.org/arrays/minimum-days-to-make-m-bouquets/
// LC: https://leetcode.com/problems/minimum-number-of-days-to-make-m-bouquets/

// O(n + (max - low + 1) * n)
public func minDays(_ bloomDay: [Int], _ m: Int, _ k: Int) -> Int {
    
    if bloomDay.count < m * k {
        return -1
    }
    
    let (low, maxi) = findSmallAndMax(arr: bloomDay)
    
    for i in low...maxi {
        
        if isPossible(i, bloomDay, m: m, k: k) {
            return i
        }
    }
    
    return -1
}

// O(n + log(max - min  + 1) * n)
public func minDays1(_ bloomDay: [Int], _ m: Int, _ k: Int) -> Int {
    // Only not possible case.
    if bloomDay.count < m * k {
        return -1
    }
    
    var (low, high) = findSmallAndMax(arr: bloomDay)
    
    while low <= high {
        let mid = (low + high) / 2
        
        if isPossible(mid, bloomDay, m: m, k: k) {
            high = mid - 1
        }
        else {
            low = mid + 1
        }
    }
    
    return low
}

func isPossible(_ number: Int, _ arr: [Int], m: Int, k: Int) -> Bool {
    var count = 0
    var bouquetCount = 0
    
    for j in arr.indices {
        
        if arr[j] <= number {
            count += 1
        }
        else {
            bouquetCount += (count / k)
            count = 0
        }
    }
    
    bouquetCount += (count / k)
    
    return bouquetCount >= m
}
